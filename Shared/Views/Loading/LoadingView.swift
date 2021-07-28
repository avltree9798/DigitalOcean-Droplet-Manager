//
//  LoadingView.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.black).edgesIgnoringSafeArea(.all)
            
            VStack{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .scaleEffect(2)
                Text("")
                Text("Loading")
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
