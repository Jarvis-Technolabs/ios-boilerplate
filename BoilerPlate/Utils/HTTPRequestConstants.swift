//
//  APIConstants.swift
//  BoilerPlate
//
//  Created by Apple M1 on 20/12/21.
//

import Foundation

struct HTTPMethod {
    static let POST             = "POST"
    static let GET              = "GET"
    static let DELETE           = "DELETE"
}

struct HTTPHeaderField {
    static let CONTENT_TYPE     = "Content-Type"
    static let Bearer           = "Bearer "
  
    static let X_API_KEY        = "x-api-key"
}

struct HTTPHeaderValue {
    static let APP_JSON         = "Application/json"
    static let Authorization    = "Authorization"
    static let X_API_KEY_VALUE  = "UP2NU3Eg6rJObrzl"
}
