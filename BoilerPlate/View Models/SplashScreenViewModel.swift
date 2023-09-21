//
//  SplashScreenViewModel.swift
//  BoilerPlate
//
//  Created by Jarvis Developer 4 on 25/02/22.
//

import Foundation
import SwiftUI

class SplashScreenViewModel: ViewModelBase {
    
    @Published var checkForceUpdateModel: CheckForceUpdateModel?
    @Published var isUpdateAvilabel = false
    @Published var gotoNextScreen = false
    @Published var goToHomeScreen = false
    @Published var activeAlert : ActiveAlertForSplash = .none
    
    @ObservedObject var settings = UserSettings()
    
    init(checkForceUpdateModel: CheckForceUpdateModel? = nil) {
        self.checkForceUpdateModel = checkForceUpdateModel
    }
    
    func checkForceUpdate() {
        if self.monitor.status == .disconnected {
            activeAlert = .isNetworkError
            self.isAlertShow = true
            return
        }
        let parameters = APIParameter.CheckForceUpdate.dictionary()
        

        httpClient.checkForceUpdateBy(parameters: parameters) { result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.checkForceUpdateModel = details
                    self.loadingState = self.checkForceUpdatSuccess ? .success : .failed
                    if let message =  self.checkForceUpdateModel?.message as? String {
                    self.strErrorMessage = message
                    self.activeAlert = .isAPIErrorAlert
                    } else {
                        self.strErrorMessage =  ""
                        self.activeAlert = .isAPIErrorAlert
           
                    }
                    self.isAlertShow = !self.checkForceUpdatSuccess
                    if let appBuild = self.checkForceUpdateModel?.data?.minIOSVersion as? String {
                        if var currentBuild = Bundle.main.infoDictionary?[AppBuildInfo.AppBundleVersion] as? String {
                            currentBuild = currentBuild.replacingOccurrences(of: ".", with: "")
                            if let intCurrentBuild = Int(currentBuild) {
                                if intCurrentBuild < Int(appBuild)! {
                                    self.isUpdateAvilabel = true
                                    Global.shared.isUpdateAvilabel = self.isUpdateAvilabel
                                    self.activeAlert = .isUpdateAvilabel
                                    self.isAlertShow = true
                                }else{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.75){
                                        if !self.settings.token.isEmpty {
                                            Global.shared.navigationAnimationsEnabled = true
                                            Global.shared.sessionToken = self.settings.token
                                            DispatchQueue.main.async{
                                                self.isUpdateAvilabel = false
                                                Global.shared.isUpdateAvilabel = self.isUpdateAvilabel
                                                self.goToHomeScreen = true
                                            }
                                        }
                                        DispatchQueue.main.async{
                                            self.gotoNextScreen = true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                    self.strErrorMessage = error.localizedDescription
                    self.activeAlert = .isAPIErrorAlert
                    self.isAlertShow = true
                }
            }
        }
    }
    
    var checkForceUpdatSuccess: Bool {
        checkForceUpdateModel?.status ?? false
    }
    
    var checkForceUpdatMessage: String {
        checkForceUpdateModel?.message ?? ""
    }
}
