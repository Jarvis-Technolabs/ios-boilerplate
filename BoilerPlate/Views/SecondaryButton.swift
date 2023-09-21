//
//  SecondaryButton.swift
//  BoilerPlate
//
//  Created by Apple M1 on 30/12/21.
//


import SwiftUI

struct SecondaryButton: View {
    var btnTitle: String
    @Binding var isTimerContinue : Bool
    var clicked: (() -> Void)
    
    var body: some View {
        
        Button(action: clicked) {
            if isTimerContinue {
                btnTitle.getSecondaryButtonTitleDisableStyle()
                    .frame(maxWidth: .infinity, maxHeight: 50.0)
                    .foregroundColor(Color.black.opacity(0.6))
            }else{
                btnTitle.getSecondaryButtonTitleStyle()
                    .frame(maxWidth: .infinity, maxHeight: 50.0)
                    .foregroundColor(AssetColors.White.color)
            }
         
        }
    }
}

