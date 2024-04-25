//
//  StationModel.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import Foundation

struct StationModel: Decodable {
    var station_id: String
    var name: String
    var address: String
    var lat: Double
    var lon: Double
    var status: StationStatusModel?
}
