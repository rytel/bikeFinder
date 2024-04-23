//
//  ApiConfig.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import Foundation

struct ApiConfig {
    static let baseUrl: URL = {
        URL(string: "https://gbfs.urbansharing.com/rowermevo.pl")!
    }()
}
