//
//  HTTPClient.swift
//  BoilerPlate
//
//  Created by Apple M1 on 17/12/21.
//

import Foundation
import UIKit
import SwiftUI

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
    case sessionExpire
}

class HTTPRequest {
    func makeHTTPRequest<T: Decodable>(url: URL,
                                       httpMethod: String,
                                       parameters: Dictionary<String,AnyObject> = Dictionary(),
                                       type: T.Type,
                                       completion: @escaping (Result<(T), NetworkError>) -> Void) {
        
        print("Request URL: \n\(url)")
        print("Request Parameters: \n\(parameters)")
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue(HTTPHeaderValue.APP_JSON, forHTTPHeaderField: HTTPHeaderField.CONTENT_TYPE)
        request.setValue(HTTPHeaderValue.X_API_KEY_VALUE, forHTTPHeaderField: HTTPHeaderField.X_API_KEY)
        if !Global.shared.sessionToken.isEmpty {
            request.setValue(HTTPHeaderField.Bearer + Global.shared.sessionToken, forHTTPHeaderField: HTTPHeaderValue.Authorization)
            print("Request Header: \n\(HTTPHeaderValue.Authorization) : \(HTTPHeaderField.Bearer +  Global.shared.sessionToken)")
        }
        
        if httpMethod == HTTPMethod.POST {
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                return
            }
            request.httpBody = httpBody
        }
        
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = 60
        session.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
                    print("Response: \n\(json)")
                    
                    guard let model = try? JSONDecoder().decode(T.self, from: data) else {
                        return completion(.failure(.decodingError))
                    }
                    
                    if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode == 440 {
                            completion(.failure(.sessionExpire))
                        }
                    }
                    completion(.success(model))
                } catch {
                    print(String(describing: error))
                    completion(.failure(.noData))
                }
            } else{
                completion(.failure(.noData))
            }
        }.resume()
        
    }
    
    func callMultipartApi<T: Decodable>(url: URL,
                                        httpMethod: String,
                                        image: UIImage,
                                        imageName: String,
                                        param : [String : AnyObject],
                                        type: T.Type,
                                        completion:@escaping (Result<(T), NetworkError>) -> Void) {
        
        print("Request URL: \n\(url)")
        print("Request Parameters: \n\(param)")
        
        let boundary = UUID().uuidString
        let session = URLSession.shared
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.POST
        urlRequest.setValue(HTTPHeaderField.Bearer + Global.shared.sessionToken, forHTTPHeaderField: HTTPHeaderValue.Authorization)
        print("Request Header: \n\(HTTPHeaderValue.Authorization) : \(HTTPHeaderField.Bearer +  Global.shared.sessionToken)")
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(imageName)\"; filename=\"\(randomString(length: 8)).jpeg\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        data.append(image.jpegData(compressionQuality: 0.7)!)
        
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        session.uploadTask(with: urlRequest, from: data, completionHandler: { data, response, error in
            if error == nil {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
                        print("Response: \n\(json)")
                        
                        guard let model = try? JSONDecoder().decode(T.self, from: data) else {
                            return completion(.failure(.decodingError))
                        }
                        
                        if let httpResponse = response as? HTTPURLResponse {
                            if httpResponse.statusCode == 440 {
                                completion(.failure(.sessionExpire))
                            }
                        }
                        
                        completion(.success(model))
                    } catch {
                        print(String(describing: error))
                        completion(.failure(.noData))
                    }
                } else{
                    completion(.failure(.noData))
                }
            }
        }).resume()
    }
}

func randomString(length: Int) -> String {
    
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = UInt32(letters.length)
    
    var randomString = ""
    
    for _ in 0 ..< length {
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        randomString += NSString(characters: &nextChar, length: 1) as String
    }
    
    return randomString
}

class HTTPClient {
    
    private let httpRequest: HTTPRequest
    init() {
        httpRequest = HTTPRequest()
    }
    

    func checkForceUpdateBy(parameters: Dictionary<String,AnyObject> = Dictionary(), completion: @escaping (Result<CheckForceUpdateModel, NetworkError>) -> Void) {
        httpRequest.makeHTTPRequest(url: API.CheckForceUpdate.toURL(), httpMethod: HTTPMethod.GET, parameters: parameters, type: CheckForceUpdateModel.self) { result in
            completion(result)
        }
    }

}
