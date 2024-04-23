//
//  ApiConnector.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import Foundation

struct ApiConnector {
    private let baseUrl = ApiConfig.baseUrl
    
    func fetchStationInformation() async throws -> [ApiStationInformation] {
        let url = UrlFactory.buildUrl(baseUrl: baseUrl, path: .stationInformation)
        //log
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let stationInformation = try JSONDecoder().decode([ApiStationInformation].self, from: data)
            return stationInformation
        } catch {
            return [] //throw error
        }
    }
    
    
}
