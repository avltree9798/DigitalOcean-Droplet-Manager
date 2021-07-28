//
//  IPGeolocatorResponse.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation

struct IPGeolocatorResponse: Codable {
    let status, country, countryCode, region: String
    let regionName, city, zip: String
    let lat, lon: Double
    let timezone, isp, org, welcomeAs: String
    let query: String

    enum CodingKeys: String, CodingKey {
        case status, country, countryCode, region, regionName, city, zip, lat, lon, timezone, isp, org
        case welcomeAs = "as"
        case query
    }
}
