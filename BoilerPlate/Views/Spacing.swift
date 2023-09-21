//
//  Spacing.swift
//  BoilerPlate
//
//  Created by Apple M1 on 30/12/21.
//

import SwiftUI

struct Spacing: View {
    var width : CGFloat? = 0
    var height : CGFloat? = 0

    var body: some View {
        Rectangle().fill(AssetColors.Black.color).frame(width: width, height: height)
    }
}

