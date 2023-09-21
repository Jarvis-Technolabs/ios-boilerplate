//
//  ButtonSetImage.swift
//  BoilerPlate
//
//  Created by Jarvis Developer 4 on 04/03/22.
//

import SwiftUI

struct ButtonSetImage: View {
    var Image: Image
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
           Image
        }
        
    }
}
