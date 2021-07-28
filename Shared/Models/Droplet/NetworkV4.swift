//
//  NetworkV4.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation

struct NetworkV4: Codable, Hashable{
    var ip_address: String?
    var netmask: String?
    var gateway: String?
    var type: String?
}
