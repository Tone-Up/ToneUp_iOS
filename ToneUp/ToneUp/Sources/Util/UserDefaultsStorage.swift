//
//  UserDefaultsStorage.swift
//  ToneUp
//
//  Created by 전준영 on 5/27/25.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    
    let key: String
    let defaultValue: T

    var wrappedValue: T {
        get {
            if T.self is [String].Type {
                return UserDefaults.standard.stringArray(forKey: key) as? T ?? defaultValue
            }
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            if let array = newValue as? [String] {
                UserDefaults.standard.set(array, forKey: key)
            } else {
                UserDefaults.standard.set(newValue, forKey: key)
            }
        }
    }
    
}

enum UserDefaultsStorage {
    
    enum Keys: String, CaseIterable {
        case fcmToken
        case userID
        case nickname
        case provider
        case isPersonal
        case isSignedUp
    }

    @UserDefault(key: Keys.fcmToken.rawValue, defaultValue: "")
    static var fcmToken: String
    
    @UserDefault(key: Keys.userID.rawValue, defaultValue: 0)
    static var userID: Int

    @UserDefault(key: Keys.nickname.rawValue, defaultValue: "")
    static var nickname: String
//    static var nickname: String {
//        get { UserDefaults.standard.string(forKey: Keys.nickname.rawValue) ?? "" }
//        set {
//            UserDefaults.standard.setValue(newValue, forKey: Keys.nickname.rawValue)
//            NotificationCenter.default.post(name: .nicknameDidChange, object: nil)
//        }
//    }

    @UserDefault(key: Keys.provider.rawValue, defaultValue: "")
    static var typeLogin: String

    @UserDefault(key: Keys.isPersonal.rawValue, defaultValue: false)
    static var latitude: Bool

    @UserDefault(key: Keys.isSignedUp.rawValue, defaultValue: false)
    static var longitude: Bool
    
    static func remove(_ key: Keys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    static func deleteAll() {
        Keys.allCases.forEach {
            UserDefaults.standard.removeObject(forKey: $0.rawValue)
        }
    }
    
}
