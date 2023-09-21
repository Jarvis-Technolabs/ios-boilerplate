//
//  Font+Extensions.swift
//  BoilerPlate
//
//  Created by Apple M1 on 29/12/21.
//

import SwiftUI

extension Font {

    #if canImport(UIKit)

    static var title = Font.custom(
        FontFamily.PoppinsBold,
        size: UIFontMetrics.default.scaledValue(for: 32)
    )

    static var subTitle = Font.custom(
        FontFamily.PoppinsRegular,
        size: UIFontMetrics.default.scaledValue(for: 20)
    )
    
    static var instructions = Font.custom(
        FontFamily.PoppinsRegular,
        size: UIFontMetrics.default.scaledValue(for: 16)
    )
    
    static var buttonTitle = Font.custom(
        FontFamily.PoppinsBold,
        size: UIFontMetrics.default.scaledValue(for: 16)
    )
    
    static var screenTitle = Font.custom(
        FontFamily.PoppinsRegular,
        size: UIFontMetrics.default.scaledValue(for: 18)
    )
    
    static var textFieldText = Font.custom(
        FontFamily.PoppinsRegular,
        size: UIFontMetrics.default.scaledValue(for: 14)
    )
    
    static var CountryText = Font.custom(
        FontFamily.PoppinsRegular,
        size: UIFontMetrics.default.scaledValue(for: 16)
    )
    
    static var OtpText = Font.custom(
        FontFamily.PoppinsBold,
        size: UIFontMetrics.default.scaledValue(for: 42)
    )
    
    static var ProfileText = Font.custom(
        FontFamily.PoppinsRegular,
        size: UIFontMetrics.default.scaledValue(for: 20)
    )
    
    static var ProfileTextFieldText = Font.custom(
        FontFamily.PoppinsRegular,
        size: UIFontMetrics.default.scaledValue(for: 16)
    )
    
    static var BottomPopupTitleText = Font.custom(
        FontFamily.PoppinsBold,
        size: UIFontMetrics.default.scaledValue(for: 18)
    )
    
    static var BottomPopupOptText = Font.custom(
        FontFamily.PoppinsRegular,
        size: UIFontMetrics.default.scaledValue(for: 16)
    )
    
    static var RegularText = Font.custom(
        FontFamily.PoppinsRegular,
        size: UIFontMetrics.default.scaledValue(for: 18)
    )
    
    static var AddLinkText = Font.custom(
        FontFamily.PoppinsRegular,
        size: UIFontMetrics.default.scaledValue(for: 14)
    )
    
    static var buttonTitleHome = Font.custom(
        FontFamily.PoppinsRegular,
        size: UIFontMetrics.default.scaledValue(for: 13)
    )
    #endif
}
