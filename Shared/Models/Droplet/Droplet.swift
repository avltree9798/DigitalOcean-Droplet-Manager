//
//  Droplet.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation

struct Droplet: Identifiable, Codable {
    var id: Int
    var name: String
    var memory: Int
    var vcpus: Int
    var disk: Int
    var locked: Bool
    var status: String
    var kernel: String?
    var created_at: String
    var features: [String]
    var backup_ids: [Int]
    var next_backup_window: BackupWindow?
    var snapshot_ids: [Int]
    var image: Image
    var volume_ids: [String]
    var size: Size
    var networks: Network
    var size_slug: String
    var region: Region
    var tags: [String]
    var vpc_uuid: String
}
