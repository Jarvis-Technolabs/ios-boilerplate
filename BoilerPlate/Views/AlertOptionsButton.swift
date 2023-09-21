//
//  PopupButton.swift
//  BoilerPlate
//
//  Created by Jarvis Developer 4 on 07/01/22.
//

import SwiftUI

enum alertButtonType {
    case Default
    case Cancel
    case Destructive
    
    var backgroundColor: Color {
        switch self {
        case .Default:
            return AssetColors.BasicBlue.color
        case .Cancel:
            return AssetColors.White.color
        case .Destructive:
            return AssetColors.Red.color
        }
    }
    
    var textColor: Color {
        switch self {
        case .Default:
            return AssetColors.White.color
        case .Cancel:
            return AssetColors.Black.color
        case .Destructive:
            return AssetColors.White.color
        }
    }
    
    var boderColor: Color {
        switch self {
        case .Default:
            return AssetColors.BasicBlue.color
        case .Cancel:
            return AssetColors.BasicBlue.color
        case .Destructive:
            return AssetColors.Red.color
        }
    }
}

struct AlertOptionsButton: View {
    
    var btnTitle: String
    var buttonType : alertButtonType = .Default
    var clicked: (() -> Void)
    var height : CGFloat = 50.0
    
    
    var body: some View {
        Button(action: clicked) {
            btnTitle.getAlertbuttonStyle(buttonType: self.buttonType)
                .frame(maxWidth: .infinity,maxHeight: height)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(buttonType.boderColor, lineWidth: 2)
                )
        }
        .background(buttonType.backgroundColor)
        .border(buttonType.boderColor, width: 1.0)
        .cornerRadius(5.0)
        
    }
}

struct PopupButton_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationButton(btnTitle: AppStrings.AddLinksScreenSave, clicked: {
        })
    }
}
