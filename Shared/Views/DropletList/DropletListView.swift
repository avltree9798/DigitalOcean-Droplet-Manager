//
//  DropletListView.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import SwiftUI

struct DropletListView: View {
    @StateObject private var viewModel: DropletListViewModel = DropletListViewModel()
    var body: some View {
        ZStack {
            NavigationView{
                List(viewModel.droplets, id: \.id) { droplet in
                    NavigationLink(destination: DropletDetailView(droplet: droplet)){
                        DropletListCellView(droplet: droplet)
                    }
                }
                .navigationTitle("Droplets")
                .toolbar {
                    Button("Logout"){
                        viewModel.logout()
                    }
                }
            }
            .onAppear{
                viewModel.getDropletList()
            }
            .onReceive(viewModel.intervalPublisher) { newTime in
                viewModel.getDropletList()
            }
            if viewModel.isLoading { LoadingView() }
        }.alert(item: $viewModel.customAlert) { customAlert in
            Alert(title: customAlert.title, message: customAlert.message, dismissButton: customAlert.dismissButton)
        }
    }
}

struct DropletListView_Previews: PreviewProvider {
    static var previews: some View {
        DropletListView()
    }
}
