//
//  AssetImages.swift
//  BoilerPlate
//
//  Created by Apple M1 on 28/12/21.
//

import Foundation
import SwiftUI

enum AssetImages: String {
    case Logo
    case Back
    case Cancel
    case DownwardArrow
    case ProfilePlaceholder
    case Camera
    case OptCamera
    case OptGallery
    case tmpImage
    case QRBackground
    case VPScan
    case VPUser
    case DummyQR
    case tmpImage2
    case Verify
    case UnVerify
    case Edit
    case AddLinks
    case BackNavigaton
    case Save
    case LinkEdit
    case LogOut
    case delete
    case remove
    
    var image: Image {
        Image(self.rawValue)
    }
}


/*
 
 *** How to use ***
 
 to set the image
 1) add an image set in asset catalogue in 1x, 2x, 3x and name it
 2) create a case with the same name as image set in the enumeration in Utils -> AssetImages -> AssetImages
 3) Set image using AssetImages.Logo.image
 
 */
