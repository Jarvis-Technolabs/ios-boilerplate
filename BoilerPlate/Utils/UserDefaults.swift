//
//  UserDefaults.swift
//  BoilerPlate
//
//  Created by Apple M1 on 21/12/21.
//


import Foundation
import Combine

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct UserDefaultConstants {
    static let isUserLoggedIn          = "isUserLoggedIn"
    static let saveLoginModel          = "saveLoginModel"
    static let token                   = "token"
    static let isUserFirstTime         = "isUserFirstTime"
    static let deviceID                = "deviceID"

}

final class UserSettings: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @UserDefault(UserDefaultConstants.isUserFirstTime, defaultValue: true)
    var isUserFirstTime: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    
    @UserDefault(UserDefaultConstants.isUserLoggedIn, defaultValue: false)
    var isUserLoggedIn: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    
    @UserDefault(UserDefaultConstants.saveLoginModel, defaultValue: Data())
    var saveLoginModel: Data {
        willSet {
            objectWillChange.send()
        }
    }
    
    @UserDefault(UserDefaultConstants.token, defaultValue: "")
    var token: String {
        willSet {
            objectWillChange.send()
        }
    }
    
    @UserDefault(UserDefaultConstants.deviceID, defaultValue: "")
    var deviceID: String {
        willSet {
            objectWillChange.send()
        }
    }
}



/*

 *** How to use: ***

 Create an observed object as follows in order to access variable objects defined in the UserDefault (preferably in the base class in order to ignore redundant declaration)
 @ObservedObject var settings = UserSettings()

 set a value using
 settings.isUserLoggedIn = false

 get a value using
 settings.isUserLoggedIn

 
 *** How to save a Codable object: ***
 
 if let encoded = try? JSONEncoder().encode(details) {
    print(encoded)
    self.settings.saveLoginModel = encoded
 }
 
 if let decoded = try? JSONDecoder().decode(LoginModel.self, from: self.settings.saveLoginModel) {
    print(decoded)
 }
 
*/
