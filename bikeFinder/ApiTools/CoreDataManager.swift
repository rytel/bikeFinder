//
//  CoreDataManager.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 24/04/2024.
//

import Foundation

class CoreDataManager {
    static func fetchDataFromServer() async {
        let connector = ApiConnector()
        
        do {
            let stationInfo = try await connector.fetchStationInformation()
            let statuses = try await connector.fetchStationStatuses()
            //check is db updated
            let context = await AppDelegate().persistentContainer.viewContext

            try stationInfo.data.stations.forEach { station in
                let newObject = Station(context: context)
                newObject.id = station.station_id
                newObject.name = station.name
                newObject.address = station.address
                newObject.latitude = station.lat
                newObject.longitude = station.lon
                
                newObject.status = Status(context: context)
                
                let statusModel = statuses.data.stations.first(where: { status in
                    status.stationId == station.station_id
                })
                
//                newObject.status?.bikeNumber = Int64(1)
//                newObject.status?.dockNumber = Int64(2)
                try context.save()
            }
        } catch {
            print("synchronization error: \(error)")
        }
    }
}
