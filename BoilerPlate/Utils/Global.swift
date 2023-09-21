//
//  Global.swift
//  BoilerPlate
//
//  Created by Apple M1 on 21/12/21.
//

import Foundation

class Global : ObservableObject {
    static let shared = Global()
    @Published var isLoggedIn = false
    @Published var navigationAnimationsEnabled = false
    @Published var isNavigationbarHidden = true
    @Published var sessionToken = ""
    @Published var userAccountID = ""
    @Published var isUpdateAvilabel = false

    private init() { }
    
}


/*
 *** How to use ***
 
 set a value using
 Global.shared.setIsLoggedIn(loggedIn: false)
 
 get a value using
 Global.shared.getIsLoggedIn()
 
 */
