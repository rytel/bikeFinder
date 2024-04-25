//
//  ApiStationInformation.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import Foundation

struct ApiStationInformation: Decodable {
    var data: ApiData
    
    struct ApiData: Decodable {
    var stations: [StationModel]
    }
}

