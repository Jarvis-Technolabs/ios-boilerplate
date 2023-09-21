//
//  DateFormatter.swift
//  BoilerPlate
//
//  Created by Apple M1 on 22/12/21.
//

import Foundation


enum DateFormatType {
    
    case apiDateFormat
    case productDateFormat
    
    var stringFormat:String {
        switch self {
        case .apiDateFormat: return "MM/dd/yyyy"
        case .productDateFormat: return "MMM d, yyyy"
            
        }
    }
}

enum NSDateFormatter {
    case apiDate
    case productDate
    
    func toString(_ forDate: Date) -> String? {
        return formatters().string(from: forDate)
    }
    
    func toDate(_ forDate: String) -> Date? {
        return formatters().date(from: forDate)
    }
    
    func formatters() -> DateFormatter {
        let formatter = DateFormatter()
        switch self {
        case .apiDate:
            formatter.dateFormat = DateFormatType.apiDateFormat.stringFormat
            
        case .productDate:
            formatter.dateFormat = DateFormatType.productDateFormat.stringFormat
        }
        return formatter
    }
}


struct Utility {
    
    static func getApiDateInfo(forDate: Date) -> String? {
        return NSDateFormatter.apiDate.toString(forDate)
    }
    
    static func getProductDateInfo(forDate: Date) -> String? {
        return NSDateFormatter.productDate.toString(forDate)
    }
    
    static func getApiDateToProductDate(forDate: String) -> String? {
        return NSDateFormatter.productDate.toString(NSDateFormatter.apiDate.toDate(forDate) ?? Date())
    }
}



/*
 *** How to use ***
 
 1.) Add a date format type in DateFormatType enum
 2.) Create a case for new date format type in NSDateFormatter enum
 3.) Create a function as per the requirement under Utility
 4.) Use the function as follows
     let productDate = Utility.getApiDateToProductDate(forDate: "12/31/1999")
 
 */
