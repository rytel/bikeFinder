//
//  ApiConnector.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import Foundation

struct ApiConnector {
    private let baseUrl = ApiConfig.baseUrl
    
    func fetchStationInformation() async throws -> ApiStationInformation {
        let url = UrlFactory.buildUrl(baseUrl: baseUrl, path: .stationInformation)
        let (data, _) = try await URLSession.shared.data(from: url)
        let stationInformation = try JSONDecoder().decode(ApiStationInformation.self, from: data)
        return stationInformation
    }
    
    func fetchStationStatuses() async throws -> ApiStationStatus {
        let url = UrlFactory.buildUrl(baseUrl: baseUrl, path: .stationStatus)
        let (data, _) = try await URLSession.shared.data(from: url)
        let stationStatus = try JSONDecoder().decode(ApiStationStatus.self, from: data)
        return stationStatus
    }
}
