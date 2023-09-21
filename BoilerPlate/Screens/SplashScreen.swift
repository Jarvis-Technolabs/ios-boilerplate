//
//  SplashScreen.swift
//  VirtualProfile
//
//  Created by Apple M1 on 28/12/21.
//

import SwiftUI

enum ActiveAlertForSplash {
    case isAPIErrorAlert
    case isUpdateAvilabel
    case isNetworkError
    case none
}

struct SplashScreen: View {
    @State private var isActive = false
    @State private var isViewAppear = false
    @State private var withAlignment: Alignment = .center
    
    @ObservedObject var splashScreenVM = SplashScreenViewModel()

    var body: some View {
        ZStack {
            BackgroundView(withAlignment: withAlignment) {
                NavigationLink(destination: goToScreen(), isActive: $splashScreenVM.gotoNextScreen) {}
                VStack {
                    LogoView()
                }.animation(isViewAppear ? .easeOut(duration: 1.5).delay(0.75) : .easeOut(duration: 0).delay(0), value: isViewAppear)
            }
        }.embedNavigationView()
            .alert(isPresented: self.$splashScreenVM.isAlertShow) {
                switch splashScreenVM.activeAlert {
                case .isUpdateAvilabel:
                    return Alert(title: Text(AppStrings.APPName), message: Text(AppAlertMessage.AppVersionForceUpdate), dismissButton: .default(Text(AppStrings.UpdateNow), action: {
                        DispatchQueue.main.async {
                            if let url = URL(string: AppStore.AppStoreURL + AppStore.AppId),
                               UIApplication.shared.canOpenURL(url){
                                UIApplication.shared.open(url)
                            }
                        }
                    }))
                case .isAPIErrorAlert:
                    return  Alert (title: Text(AppAlertTitle.Error),
                                   message: Text(self.splashScreenVM.strErrorMessage),
                                   dismissButton: .default(Text(AppStrings.Ok)))
                case .isNetworkError:
                    return Alert(title: Text(AppAlertTitle.Network), message: Text(AppAlertMessage.InternetError), dismissButton: .default(Text(AppStrings.Ok), action: {
                        DispatchQueue.main.async {
                            self.splashScreenVM.checkForceUpdate()
                        }
                    }))
                case .none:
                    return Alert(title: Text(""))
               
                }
            }
            .onAppear {
                withAlignment = .center
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAlignment = .top
                    self.isViewAppear = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.50) {
                        self.splashScreenVM.checkForceUpdate()
                    }
                }
            }
    }
    
    @ViewBuilder func goToScreen() -> some View {
        if self.splashScreenVM.goToHomeScreen {
          //  HomeScreen()
        } else{
            //LoginScreen()
        }
    }
}

