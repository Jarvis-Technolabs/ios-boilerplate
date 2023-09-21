//
//  ConfirmationButton.swift
//  BoilerPlate
//
//  Created by Apple M1 on 31/12/21.
//

import SwiftUI

struct ConfirmationButton: View {
    var btnTitle: String
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            btnTitle.getConfirmationButtonTitleStyle()
                .frame(maxWidth: .infinity,maxHeight: 50.0)
        }
        .background(AssetColors.BasicBlue.color)
        .clipShape(Capsule())
    }
}

struct ConfirmationButton_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationButton(btnTitle: AppStrings.AddLinksScreenSave, clicked: {
        })
    }
}
