//
//  DropletCellView.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import SwiftUI

struct DropletListCellView: View {
    let droplet: Droplet
    var body: some View {
        HStack{
            VStack (alignment: .leading, spacing: 5){
                Text(droplet.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text(droplet.region.name)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }
}
//
//struct DropletCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        DropletCellView()
//    }
//}
