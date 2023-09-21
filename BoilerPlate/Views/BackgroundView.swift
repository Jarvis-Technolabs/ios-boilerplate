//
//  BackgroundView.swift
//  BoilerPlate
//
//  Created by Apple M1 on 28/12/21.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    let content: Content
    var withAlignment: Alignment = .center
    init(withAlignment: Alignment, @ViewBuilder content: () -> Content) {
        self.withAlignment = withAlignment
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: withAlignment) {
            Rectangle().frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight).foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [AssetColors.GradientLight.color, AssetColors.GradientDark.color]), startPoint: .top, endPoint: .bottom))
            content
                .padding(.all, 30)
        }.edgesIgnoringSafeArea(.all)
    }
}

