//
//  ApiStationStatus.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import Foundation

class ApiStationStatus: Decodable {
//    var last_updated: String
//    var ttl: Int
//    var version: String
    var data: ApiData
    
    struct ApiData: Decodable {
        var stations: [StationStatusModel]
    }
}
