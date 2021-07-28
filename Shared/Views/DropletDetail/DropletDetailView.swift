//
//  DropletDetailView.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import SwiftUI

struct DropletDetailView: View {
    @State var droplet: Droplet
    @StateObject private var viewModel: DropletDetailViewModel = DropletDetailViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                Text(droplet.name)
                    .font(.title)
                    .fontWeight(.bold)
                Text("Status: \(droplet.status)")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                Text("Region: \(droplet.region.name)")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                Divider()
                Text("Actions")
                    .font(.title2)
                    .fontWeight(.bold)
                
                HStack{
                    Button("Reboot Machine") {
                        viewModel.reboot(droplet: droplet)
                    }
                    if droplet.status == "active" {
                        Button("Shutdown Machine") {
                            viewModel.shutdown(droplet: droplet)
                        }
                    }else{
                        Button("Power On Machine") {
                            viewModel.powerOn(droplet: droplet)
                        }
                    }
                }
                Divider()
                HStack(alignment: .top, spacing: 2){
                    SpecificationView(droplet: droplet)
                    NetworkView(droplet: droplet)
                }
                Divider()
                VStack{
                    Text("Monthly Price: $\(droplet.size.price_monthly)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                }
            }
            .alert(item: $viewModel.customAlert) { customAlert in
                Alert(title: customAlert.title, message: customAlert.message, dismissButton: customAlert.dismissButton)
            }
            if viewModel.isLoading { LoadingView() }
        }
        .onAppear(perform: {
            self.viewModel.view = self
            self.viewModel.refreshDroplet()
        })
        .onReceive(viewModel.intervalPublisher) { newTime in
            viewModel.refreshDroplet()
        }
    }
}

//struct DropletDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DropletDetailView()
//    }
//}
