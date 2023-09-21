//
//  String+Extensions.swift
//  BoilerPlate
//
//  Created by Apple M1 on 29/12/21.
//

import Foundation
import SwiftUI

extension String {
    
    var digits: [Int] {
        var result = [Int]()
        for char in self {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }
        return result
    }
    
    func getRegulerTextStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.Black.color).font(.RegularText).fontWeight(.medium)
    }
    
    func getTitleTextStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.White.color).font(.title).fontWeight(.bold)
    }
    
    func getSubtitleStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.White.color).font(.subTitle).fontWeight(.regular)
    }
    
    func getPrimaryButtonTitleStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.Black.color).font(.buttonTitle).fontWeight(.semibold)
    }
    
    func getSecondaryButtonTitleStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.White.color).font(.buttonTitle).fontWeight(.semibold)
    }
    
    func getSecondaryButtonTitleDisableStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.White.color.opacity(0.5)).font(.buttonTitle).fontWeight(.semibold)
    }
    
    func getInstructionsStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.White.color).font(.instructions).fontWeight(.none)
    }

    func getScreenTitleStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.White.color).font(.screenTitle).fontWeight(.semibold)
    }
    
    func getConfirmationButtonTitleStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.White.color).font(.buttonTitle).fontWeight(.none)
    }
    
    func getPhoneNumberTextStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.White.color).font(.textFieldText).fontWeight(.none)
    }
    
    func getCountryTextStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.Black.color).font(.CountryText).fontWeight(.none)
    }
    
    func getOtpTextStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.White.color).font(.OtpText).fontWeight(.semibold)
    }
    
    func getProfileTextStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.Black.color).font(.ProfileText).fontWeight(.none)
    }
    
    func getProfileTextFieldStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.Black.color).font(.ProfileTextFieldText).fontWeight(.none)
    }
    
    func getPopupbuttonStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.White.color).font(.ProfileTextFieldText).fontWeight(.medium)
    }
    
    func getBottomPopupTitleText() -> Text {
        return Text(self).foregroundColor(AssetColors.Black.color).font(.BottomPopupTitleText).fontWeight(.semibold)
    }
    
    func getBottomPopupOptText() -> Text {
        return Text(self).foregroundColor(AssetColors.Black.color).font(.BottomPopupOptText).fontWeight(.none)
    }
    
    func getAlertbuttonStyle(buttonType : alertButtonType) -> Text {
        return Text(self).foregroundColor(buttonType.textColor).font(.ProfileTextFieldText).fontWeight(.medium)
    }
    
    func getAddLinkCellText() -> Text {
        return Text(self).foregroundColor(AssetColors.Black.color).font(.AddLinkText).fontWeight(.medium)
    }
    
    func getHomeButtonTitleStyle() -> Text {
        return Text(self).foregroundColor(AssetColors.White.color).font(.buttonTitleHome).fontWeight(.none)
    }
    
}
