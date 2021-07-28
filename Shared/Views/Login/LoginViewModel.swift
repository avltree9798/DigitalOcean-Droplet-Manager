//
//  LoginViewModel.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Security
import Foundation

final class LoginViewModel: ObservableObject{
    private var session: Session = Session.instance
    
    func login(token: String){
        if self.canStoreTokenToKeychain(token: token) {
            self.session.isLoggedIn = true
        }
    }
    func canStoreTokenToKeychain(token: String) -> Bool {
        return KeychainManager.instance.storeItem(key: KeychainManager.instance.tokenKey, data: token)
    }
    
    func retreiveTokenFromKeychain() -> String? {
        return KeychainManager.instance.retreiveItem(key: KeychainManager.instance.tokenKey) as? String
    }
}
