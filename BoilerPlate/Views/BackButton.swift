//
//  BackButton.swift
//  BoilerPlate
//
//  Created by Apple M1 on 30/12/21.
//

import SwiftUI

struct BackButton: View {
    var withBorder: Bool = true
    var clicked: (() -> Void)
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            clicked()
            self.presentationMode.wrappedValue.dismiss()
        }) {
            VStack() {
                AssetImages.Back.image
                    .padding(.trailing, withBorder ? 0 : 40)
            }.frame(maxWidth: 50.0 ,maxHeight: 50.0)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(self.withBorder ? AssetColors.Border.color : AssetColors.Clear.color, lineWidth: 1)
        )
    }
}
