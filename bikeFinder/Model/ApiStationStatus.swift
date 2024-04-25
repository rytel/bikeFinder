//
//  ApiStationStatus.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import Foundation

class ApiStationStatus: Decodable {
    var data: ApiData
    
    struct ApiData: Decodable {
        var stations: [StationStatusModel]
    }
}
