//
//  Image.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation

struct Image: Codable{
    var id: Int
    var name: String
    var type: String
    var distribution: String
    var slug: String?
    var `public`: Bool
    var regions: [String]
    var created_at: String
    var min_disk_size: Int
    var size_gigabytes: Float
    var description: String
    var tags: [String]
    var status: String
    var error_message: String?
}
