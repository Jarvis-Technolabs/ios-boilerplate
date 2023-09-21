//
//  CountryModel.swift
//
//
//  Created by JD on 29/12/21.
//


import Foundation
import SwiftUI

struct Country: Hashable {
    
    var code: String
    var name: String
    var phoneCode: String
    var flag: Image? {
        guard let imagePath = Bundle.main.path(forResource: "\(code.uppercased())", ofType: AppFileExtensions.Png) else { return nil }
        guard let uiImage = UIImage(contentsOfFile: imagePath) else { return nil }
        return Image.init(uiImage: uiImage)
    }
    
    // Populates the metadata from the included json file resource
    static func countryNamesByCode() -> [Country] {
        var countries = [Country]()
        if  let jsonPath = Bundle.main.path(forResource: AppFileNames.CountryCodes, ofType: AppFileExtensions.Json) {
            
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) {
                
                do {
                    if let jsonObjects = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? NSArray {
                        
                        for jsonObject in jsonObjects {
                            
                            guard let countryObj = jsonObject as? NSDictionary else {  return countries }
                            
                            guard let code = countryObj[StaticNameOfVariable.Vcode] as? String, let phoneCode = countryObj[StaticNameOfVariable.VdialCode] as? String, let name = countryObj[StaticNameOfVariable.Vname] as? String else {
                                return countries
                            }
                            
                            let country = Country(code: code, name: name, phoneCode: phoneCode)
                            countries.append(country)
                        }
                    }
                }
                catch let err {
                    print("Error = \(err.localizedDescription)")
                }
            }
        }
        return countries
    }
}
