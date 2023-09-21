//
//  Int+Extensions.swift
//  BoilerPlate
//
//  Created by Jarvis Developer 4 on 05/01/22.
//

import SwiftUI

extension Int {
    var numberString: String {
        guard self < 10 else { return "0" }
        return String(self)
    }
}
