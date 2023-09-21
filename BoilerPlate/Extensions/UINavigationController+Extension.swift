//
//  UINavigationController+Extension.swift
//  BoilerPlate
//
//  Created by Apple M1 on 28/12/21.
//

import Foundation
import SwiftUI

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        DispatchQueue.main.async {
            self.navigationItem.setHidesBackButton(true, animated: true);
            UINavigationBar.setAnimationsEnabled(Global.shared.navigationAnimationsEnabled)
            self.isNavigationBarHidden = Global.shared.isNavigationbarHidden
        }
    }
}
