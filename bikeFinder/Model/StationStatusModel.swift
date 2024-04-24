//
//  StationStatusModel.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 24/04/2024.
//

import Foundation

class StationStatusModel: Decodable {
    let stationId: String
    let bikeCount: Int
    let dockCount: Int
}
