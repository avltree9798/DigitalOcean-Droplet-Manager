//
//  NetworkV6.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation

struct NetworkV6: Codable, Hashable{
    var ip_address: String?
    var netmask: Int?
    var gateway: String?
    var type: String?
}
