//
//  ViewModelBase.swift
//  BoilerPlate
//
//  Created by Apple M1 on 17/12/21.
//

import Foundation
import SwiftUI

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
    @Published var error: Bool = false
    @Published var monitor = Monitor()
    @Published var isAlertShow: Bool = false
    @Published var isValidationError: Bool = false
    @Published var isSessionExpire: Bool = false
    @Published var strErrorMessage: String = ""
    var httpClient: HTTPClient

    init() {
        httpClient = HTTPClient()
    }
}
