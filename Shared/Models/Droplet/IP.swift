//
//  IP.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation

public protocol IP{
    var ip_address: String? {get set}
    var netmask: Any? {get set}
    var gateway: String? {get set}
    var type: String? {get set}
}
