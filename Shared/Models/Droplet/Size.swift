//
//  Size.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation

struct Size: Codable{
    var slug: String
    var memory: Int
    var vcpus: Int
    var disk: Int
    var transfer: Float
    var price_monthly: Float
    var price_hourly: Float
    var regions: [String]
    var available: Bool
    var description: String
}
