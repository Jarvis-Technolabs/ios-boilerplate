//
//  LogoView.swift
//  BoilerPlate
//
//  Created by Apple M1 on 28/12/21.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack {
            AssetImages.Logo.image
        }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight * 0.40, alignment: .center)
        
    }
}

