//
//  SpecificationView.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import SwiftUI

struct SpecificationView: View {
    var droplet: Droplet
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            Text("Specification")
                .font(.title2)
                .fontWeight(.bold)
            Text("Memory: \(droplet.memory) MB")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
            Text("V-CPUs: \(droplet.vcpus)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
            Text("Storage: \(droplet.disk) GB")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
            Text("Transfer Rate: \(droplet.size.transfer) TB")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
        }
        .padding()
    }
}
