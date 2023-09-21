//
//  File.swift
//  BoilerPlate
//
//  Created by Apple M1 on 28/12/21.
//

import SwiftUI
import LoaderUI

struct LoadingView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [AssetColors.GradientLight.color, AssetColors.GradientDark.color]),
                       startPoint: .top,
                       endPoint: .bottom)
            .mask(BallPulseSync().frame(width: 35.0, height: 35.0, alignment: .center))
            .frame(width: 65.0, height: 65.0, alignment: .center)
            .background(AssetColors.White.color)
            .cornerRadius(15.0)
    }
}
