//
//  DataManager.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 24/04/2024.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "bikeFinder")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static func fetchDataFromServer() async -> [StationModel] {
        let connector = ApiConnector()
        do {
            let stationInfo = try await connector.fetchStationInformation()
            let statuses = try await connector.fetchStationStatuses()
            let stations = stationInfo.data.stations.map { station in
                var station = station
                station.status = statuses.data.stations.first(where: { $0.stationId == station.station_id })
                return station
            }
            return stations
        } catch {
            print(error)
            return []
        }
    }
    
    static func fetchAndSaveDataFromServer() async {
        do {
            try await fetchDataFromServer().forEach { station in
                let context = shared.persistentContainer.viewContext
                let newObject = Station(context: context)
                newObject.id = station.station_id
                newObject.name = station.name
                newObject.address = station.address
                newObject.latitude = station.lat
                newObject.longitude = station.lon
                
                newObject.status = Status(context: context)
                newObject.status?.bikeNumber = Int64(station.status!.bikeCount)
                newObject.status?.dockNumber = Int64(station.status!.dockCount)
                try context.save()
            }
        } catch {
            print(error)
        }
    }
}
