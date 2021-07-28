//
//  DropletApp.swift
//  Shared
//
//  Created by Anthony V on 7/28/21.
//

import SwiftUI

@main
struct DropletApp: App {
    @StateObject private var loginViewModel : LoginViewModel = LoginViewModel()
    @StateObject private var session: Session = Session.instance
    init () {
        checkSession()
    }
    
    func checkSession(){
        if loginViewModel.retreiveTokenFromKeychain() != nil {
            DispatchQueue.main.async {
                session.isLoggedIn = true
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if session.isLoggedIn {
                DropletListView()
            }else {
                LoginView()
            }
        }
    }
}
