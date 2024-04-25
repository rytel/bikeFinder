//
//  ApiConnector.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import Foundation

struct ApiConnector {
    fileprivate let baseUrl = ApiConfig.baseUrl
    
    func fetchStationInformation() async throws -> ApiStationInformation {
        try await fetch(path: .stationInformation)
    }
    
    func fetchStationStatuses() async throws -> ApiStationStatus {
        try await fetch(path: .stationStatus)
    }
}

fileprivate extension ApiConnector {
    func fetch<T:Decodable>(path: ApiEndpointPath) async throws -> T {
        let url = UrlFactory.buildUrl(baseUrl: baseUrl, path: path)
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(T.self, from: data)
        return response
    }
}
