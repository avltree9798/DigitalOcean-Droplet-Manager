//
//  Region.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation

struct Region: Codable{
    var name: String
    var slug: String
    var features: [String]
    var available: Bool
    var sizes: [String]
}
