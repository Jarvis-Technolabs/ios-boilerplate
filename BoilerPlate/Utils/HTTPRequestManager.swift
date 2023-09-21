//
//  HTTPManager.swift
//  BoilerPlate
//
//  Created by Apple M1 on 20/12/21.
//

import Foundation
import SwiftUI

enum API {
    
    case CheckForceUpdate    
    
    
    private func requestString() -> String {
        
        switch self {
            
        case .CheckForceUpdate:
            return URLs.BASE_URL + APINames.VCheckForceUpdate
            
        }
    }
    
    func toURL() -> URL {
        return URL(string: requestString())!
    }
}

enum APIParameter {

    case CheckForceUpdate


    
    func dictionary() -> Dictionary<String, AnyObject> {
        
        switch self {
            
        case .CheckForceUpdate:
            let requestDictionary : Dictionary<String,AnyObject> = Dictionary()
            return requestDictionary as Dictionary<String, AnyObject>

        }
    }
}


