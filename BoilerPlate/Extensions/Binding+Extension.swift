//
//  Binding+Extension.swift
//  BoilerPlate
//
//  Created by Jarvis Developer 4 on 13/01/22.
//

import SwiftUI

extension Binding where Value == String? {
    func onNone(_ fallback: String) -> Binding<String> {
        return Binding<String>(get: {
            return self.wrappedValue ?? fallback
        }) { value in
            self.wrappedValue = value
        }
    }
}

