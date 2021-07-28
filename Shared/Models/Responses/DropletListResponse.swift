//
//  DropletListResponse.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation

struct DropletListResponse: Codable {
    let droplets: [Droplet]
    let links: Link?
    let meta: Meta?
}
