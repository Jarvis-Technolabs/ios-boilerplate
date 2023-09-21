//
//  Constants.swift
//  BoilerPlate
//
//  Created by Apple M1 on 17/12/21.
//

import Foundation

struct URLs {
#if DEVELOPMENT
    static let BASE_URL                   = "http://example_dev.com/"
#elseif PRODUCTION
    static let BASE_URL                   = "http://example_prod.com/"
#elseif STAGING
    static let BASE_URL                   = "http://example_stag.com/"
#endif
    
  
}

struct AppStore {
    static let AppStoreURL                = "itms-apps://itunes.apple.com/app/"
    static let AppId                      = "id_1234"
}

struct AppBuildInfo {
    static let AppBundleVersion           = "CFBundleVersion"
}

struct APINames {
    static let VCheckForceUpdate          = "ConfigInfo/checkConfigUpdate"
}

struct StaticNameOfVariable {
    
    // *** Country Model keys ***
    static let Vcode                      = "code"
    static let VdialCode                  = "dial_code"
    static let Vname                      = "name"
    
    // *** VLogin ***
    static let VphoneNumber               = "phoneNumber"
    static let VcountryCode               = "countryCode"
    static let VdeviceType                = "deviceType"
    static let VdeviceId                  = "deviceId"
    static let VfcmId                     = "fcmId"
    
}

struct AppFileNames {
    static let CountryCodes               = "countryCodes"
    static let ProfileLinkData            = "profileLinkData"
    static let AddLinkData                = "addLinkData"
}

struct AppFileExtensions {
    static let Png                        = "png"
    static let Json                       = "json"
}


struct AppStrings {
    

    // *** OTP screen ***
    static let OTPScreenButtonSubmit      = "SUBMIT"
    static let OTPScreenButtonResendOTP   = "RESEND OTP"
    
    // *** Profile screen ***
    static let ProfileScreenTitle         = "Profile"
    static let ProfileScreenNext          = "Next"
    static let ProfileScreenSave          = "Save"
    static let EditProfileScreenTitle     = "Edit Profile"
    
    
    // *** Add Links screen **
    static let AddLinksScreenSave         = "Save"

    
    // *** Home screen ***
    static let HomeScreenTitle            = "Title"
   
    
    
    // *** Select country screen ***
    static let SelectCountryTitle         = "Select Country"
    
    
    // *** ImagePicker Bottom view screen ***
    static let ChooseMethod               = "Choose Method"
    static let PickFromGallery            = "Pick from Gallery"
    static let CaptureImage               = "Capture Image"
    
    // *** Profile screen ***
    static let Check                      = "Check"
    static let Settings                   = "Settings"
    static let Cancel                     = "Cancel"
    static let Save                       = "Save"
    static let Delete                     = "Delete"
    static let Yes                        = "Yes"
    static let No                         = "No"
    
    static let Done                       = "Done"
    static let upTextField                = "chevron.up"
    static let DownTextField              = "chevron.down"
    static let Skip                       = "Skip"
    static let Ok                         = "Ok"
    static let DeviceType                 = "iOS"
    
    static let UpdateNow                  = "Update Now "
    static let APPName                    = "BoilerPlate"
    static let Logout                     = "Logout"
}

struct AppPlaceholders {
    static let PhoneNumber                = "Phone Number"
    static let Search                     = "Search"
    
    // *** Profile screen ***
    static let UserId                     = "User ID"
    static let Emailid                    = "Email ID"
}

struct AppAlertTitle {
 
    static let Warning                    = "Warning"
    static let Error                      = "Error"
    static let Success                    = "Success"
    static let Note                       = "Note"
    static let Network                    = "Network Error"
}

struct AppAlertMessage {
    static let GtoSettings                = "Go to Settings?"
    static let OtpInvalid                 = "OTP is Invalid."
    static let PleaseEnterValidMobile     = "Please Enter Valid Phone Number"
    static let PleaseEnterMobile          = "Please Enter Phone Number"
    static let AppVersionForceUpdate      = "To continue uninterrupted use of the \(AppStrings.APPName) Application, you will need to update it on your device."
    static let InternetError              = "Please check your internet connection"
}



struct AppValidationMessages {
    static let InvalidPhoneNumber         = "Phone number is not valid"
  
}

struct AppStingFilter {
    static let OnlyNumber                 = "+ 0123456789"
    static let UserIDTextContains         = "0123456789abcdefghijklmnopqrstuvwxyz"
    static let UserNameTextContains       = "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz"
}

struct FontFamily {
    static let PoppinsBold                = "Poppins-Bold"
    static let PoppinsRegular             = "Poppins-Regular"
    static let PoppinsLight               = "Poppins-Light"
}
