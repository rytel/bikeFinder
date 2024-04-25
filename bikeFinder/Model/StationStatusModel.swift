//
//  StationStatusModel.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 24/04/2024.
//

import Foundation

struct StationStatusModel: Decodable {
    let stationId: String
    let bikeCount: Int
    let dockCount: Int
    
    enum CodingKeys: String, CodingKey {
        case stationId = "station_id"
        case bikeCount = "num_bikes_available"
        case dockCount = "num_docks_available"
    }
}
