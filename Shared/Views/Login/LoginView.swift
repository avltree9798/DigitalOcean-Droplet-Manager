//
//  ContentView.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel = LoginViewModel()
    @State private var token: String = ""
    var body: some View {
        VStack {
            Text("Please enter your DigitalOcean token")
                .padding()
            SecureField("Token", text: $token)
                .padding()
            Button("Login"){
                viewModel.login(token: token)
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
