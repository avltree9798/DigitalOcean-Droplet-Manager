//
//  KeychainManager.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/27/21.
//

import Foundation


final class KeychainManager {
    static let instance: KeychainManager = KeychainManager()
    let tokenKey = "com.avltree9798.DigitalOcean-Droplet.token"
    func retreiveItem(key: String) -> Any?{
        let query: [String:Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        
        var item: CFTypeRef?
        
        if SecItemCopyMatching(query as CFDictionary, &item) == noErr {
            if let existingItem = item as? [String: Any],
               let itemData = existingItem[kSecValueData as String] as? Data,
               let item = String(data: itemData, encoding: .utf8) {
                return item
            }else{
                return nil
            }
        }else{
            return nil
        }
    }
    
    func removeItem(key: String) {
        let attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        SecItemDelete(attributes as CFDictionary)
    }
    
    func storeItem(key: String, data: String) -> Bool {
        let attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlockedThisDeviceOnly,
            kSecValueData as String: data.data(using: .utf8)!
        ]
        SecItemDelete(attributes as CFDictionary)
        let status = SecItemAdd(attributes as CFDictionary, nil)
        if status == noErr {
            return true
        }else{
            return false
        }
    }
}
