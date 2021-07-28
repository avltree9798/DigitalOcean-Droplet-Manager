//
//  NetworkView.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import SwiftUI

struct NetworkView: View {
    var droplet: Droplet
    var viewModel: DropletDetailViewModel = DropletDetailViewModel()
    var body: some View {
        VStack(alignment: .trailing, spacing:2){
            Text("Networking")
                .font(.title2)
                .fontWeight(.bold)
            Text("IPv4")
                .foregroundColor(.secondary)
                .fontWeight(.bold)
            ForEach(droplet.networks.v4, id: \.self){ ipv4 in
                HStack {
                    Text("IP Address: \(ipv4.ip_address ?? "None")")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                    Button("Copy"){
                        viewModel.copy(str: ipv4.ip_address ?? "")
                    }
                }
            }
            Text("IPv6")
                .foregroundColor(.secondary)
                .fontWeight(.bold)
            ForEach(droplet.networks.v6, id: \.self){ ipv6 in
                HStack {
                    Text("IP Address: \(ipv6.ip_address ?? "None")")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                    Button("Copy"){
                        viewModel.copy(str: ipv6.ip_address ?? "")
                    }
                }
                
            }
        }
        .padding()
    }
}
