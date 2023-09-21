//
//  UIDevice+Extension.swift
//  BoilerPlate
//
//  Created by Apple M1 on 05/01/22.
//

import SwiftUI

extension UIDevice {
    var hasNotch: Bool {
        guard #available(iOS 11.0, *), let window = UIApplication.shared.keyWindow else { return false }
        if UIDevice.current.orientation.isPortrait {
            return window.safeAreaInsets.top >= 44
        } else {
            return window.safeAreaInsets.left > 0 || window.safeAreaInsets.right > 0
        }
    }
}
