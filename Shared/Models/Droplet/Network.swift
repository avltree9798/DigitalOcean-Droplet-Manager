//
//  Network.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation

struct Network: Codable{
    var v4: [NetworkV4]
    var v6: [NetworkV6]
}
