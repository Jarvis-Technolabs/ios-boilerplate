//
//  View+Extensions.swift
//  BoilerPlate
//
//  Created by Apple M1 on 28/12/21.
//

import Foundation
import SwiftUI

extension UIView {

    var screenShot: UIImage {
        let rect = self.bounds
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        self.layer.render(in: context)
        let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return capturedImage
    }
}

extension View {
    
    /*func goBackToLogin() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            @ObservedObject var settings = UserSettings()
            Global.shared.sessionToken = ""
            Global.shared.userAccountID  = ""
            settings.token = Global.shared.sessionToken
            let window = UIApplication.shared.connectedScenes.flatMap{ ($0 as? UIWindowScene)?.windows ?? [] }.first{$0.isKeyWindow}
            window?.rootViewController = UIHostingController(rootView: LoginScreen())
            window?.makeKeyAndVisible()
        }
    } */
  
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
    
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
    
    public func keyboardAware() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAware())
    }
    
    
    @ViewBuilder func toolKitView(focusedField: FocusState<String?>.Binding, array: [String]) -> some View {
        if !array.isEmpty {
            self.toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Button(action: {
                            let indexOfA = array.firstIndex(of: focusedField.wrappedValue!)!
                            let isIndexValid = array.indices.contains(indexOfA - 1)
                            if isIndexValid {
                                focusedField.wrappedValue = array[indexOfA - 1]
                            }
                        }) {
                            Image(systemName: AppStrings.upTextField)
                        }
                        .disabled(!canFocusPreviousField(focusedField: focusedField.wrappedValue, array: array)) // remove this to loop through fields
                        
                        Button(action: {
                            let indexOfA = array.firstIndex(of: focusedField.wrappedValue!)!
                            let isIndexValid = array.indices.contains(indexOfA + 1)
                            if isIndexValid {
                                focusedField.wrappedValue = array[indexOfA + 1]
                            }
                        }) {
                            Image(systemName: AppStrings.DownTextField)
                        }
                        .disabled(!canFocusNextField(focusedField: focusedField.wrappedValue, array: array))
                    }
                    Spacer()
                    Button(action: {UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)}) {
                        AppStrings.Done.getRegulerTextStyle()
                    }
                }
            }
        } else {
            self
        }
    }
    
    
    @ViewBuilder func toolKitViewForLogin(focusedField: FocusState<String?>.Binding, array: [String]) -> some View {
        if !array.isEmpty {
            self.toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Button(action: {
                            let indexOfA = array.firstIndex(of: focusedField.wrappedValue!)!
                            let isIndexValid = array.indices.contains(indexOfA - 1)
                            if isIndexValid {
                                focusedField.wrappedValue = array[indexOfA - 1]
                            }
                        }) {
                            Image(systemName: AppStrings.upTextField)
                        }
                        .disabled(!canFocusPreviousField(focusedField: focusedField.wrappedValue, array: array)) // remove this to loop through fields
                        
                        Button(action: {
                            let indexOfA = array.firstIndex(of: focusedField.wrappedValue!)!
                            let isIndexValid = array.indices.contains(indexOfA + 1)
                            if isIndexValid {
                                focusedField.wrappedValue = array[indexOfA + 1]
                            }
                        }) {
                            Image(systemName: AppStrings.DownTextField)
                        }
                        .disabled(!canFocusNextField(focusedField: focusedField.wrappedValue, array: array))
                    }
                    Spacer()
                    Button(action: {UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)}) {
                        AppStrings.Done.getRegulerTextStyle()
                    }
                }
            }
        } else {
            self
        }
    }
    
    private func canFocusPreviousField(focusedField: String?, array: [String]) -> Bool {
        guard let currentFocusedField = focusedField else {
            return false
        }
        let indexOfA = array.firstIndex(of: currentFocusedField)!
        let isIndexValid = array.indices.contains(indexOfA - 1)
        return isIndexValid
    }
    
    private func canFocusNextField(focusedField: String?, array: [String]) -> Bool {
        guard let currentFocusedField = focusedField else {
            return false
        }
        let indexOfA = array.firstIndex(of: currentFocusedField)!
        let isIndexValid = array.indices.contains(indexOfA + 1)
        return isIndexValid
    }
}
