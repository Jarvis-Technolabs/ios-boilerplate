//
//  AssetsColors.swift
//  BoilerPlate
//
//  Created by Apple M1 on 23/12/21.
//

import Foundation
import SwiftUI

enum AssetColors: String {
    case GradientLight
    case GradientDark
    case White
    case Black
    case Border
    case Clear
    case Shadow
    case BasicBlue
    case Red
    
    var color: Color {
        Color(self.rawValue)
    }
}


/*
 
 *** How to use ***
 
 Add a color in Assets and using the same name, create a case in AssetColors enum
 
 using enum
 AssetColors.GradientLight.color
 
 using extension
 Color.appColor(.appYellow)
 
 */
