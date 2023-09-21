//
//  PrimaryButton.swift
//  BoilerPlate
//
//  Created by Apple M1 on 29/12/21.
//

import SwiftUI

struct PrimaryButton: View {
    
    var btnTitle: String
    var isDisable : Bool
    var clicked: (() -> Void)
   
    
    var body: some View {
        Button(action: clicked) {
            btnTitle.getPrimaryButtonTitleStyle()
                .frame(maxWidth: .infinity,maxHeight: 60.0)
                .foregroundColor(isDisable ? AssetColors.Black.color.opacity(0.6) : AssetColors.Black.color)
        }
        .background(isDisable ? AssetColors.White.color.opacity(0.6) : AssetColors.White.color)
        .clipShape(Capsule())
        .disabled(isDisable)
    }
}

