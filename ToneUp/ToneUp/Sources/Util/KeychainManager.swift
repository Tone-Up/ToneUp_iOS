//
//  KeychainManager.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation

///여기서 상세하게 적은 이유가 비슷한게 있으면 충돌날 경우가 있어서 대비
enum KeychainKey: String, CaseIterable {
    case accessToken = "com.toneup.keychain.accessToken"
    case refreshToken = "com.toneup.keychain.refreshToken"
    case userID = "com.toneup.keychain.userID"
}

final class KeychainManager {
    
    @discardableResult
    static func save(_ value: String,
                     forKey key: KeychainKey) -> Bool {
        delete(forKey: key)
        
        guard let data = value.data(using: .utf8) else { return false }
        
        let query: [String: Any] = [
            kSecClass as String      : kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecValueData as String  : data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    @discardableResult
    static func delete(forKey key: KeychainKey) -> Bool {
        let query: [String: Any] = [
            kSecClass as String      : kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess || status == errSecItemNotFound
    }
    
    static func load(forKey key: KeychainKey) -> String? {
        let query: [String: Any] = [
            kSecClass as String      : kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecReturnData as String : kCFBooleanTrue!,
            kSecMatchLimit as String : kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        guard status == errSecSuccess,
              let data = dataTypeRef as? Data,
              let value = String(data: data,
                                 encoding: .utf8)
        else {
            return nil
        }
        
        return value
    }
    
    static func clearAll() {
        for key in KeychainKey.allCases {
            _ = delete(forKey: key)
        }
    }
    
}
