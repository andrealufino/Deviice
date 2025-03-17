//
//  File.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 17/03/25.
//

import Foundation


/// This is the model of the device.
public enum Model: String, Codable {
    
    case notMapped
            
    // MARK: iPod
    case iPodTouch1
    case iPodTouch2
    case iPodTouch3
    case iPodTouch4
    case iPodTouch5
    case iPodTouch6
    case iPodTouch7
            
    // MARK: iPhone
    case iPhone2G
    case iPhone3G
    case iPhone3Gs
    case iPhone4
    case iPhone4s
    case iPhone5
    case iPhone5c
    case iPhone5s
    case iPhone6
    case iPhone6Plus
    case iPhone6s
    case iPhone6sPlus
    case iPhoneSE
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPhoneXs
    case iPhoneXsMax
    case iPhoneXr
    case iPhone11
    case iPhone11Pro
    case iPhone11ProMax
    case iPhoneSE2
    case iPhone12mini
    case iPhone12
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone13mini
    case iPhone13
    case iPhone13Pro
    case iPhone13ProMax
    case iPhoneSE3
    case iPhone14
    case iPhone14Plus
    case iPhone14Pro
    case iPhone14ProMax
    case iPhone15
    case iPhone15Plus
    case iPhone15Pro
    case iPhone15ProMax
    case iPhone16
    case iPhone16Plus
    case iPhone16Pro
    case iPhone16ProMax
    case iPhone16e
            
    // MARK: iPad
    
    // iPad
    case iPad97Inch1
    case iPad97Inch2
    case iPad97Inch3
    case iPad97Inch4
    case iPad97Inch5
    case iPad102Inch7
    case iPad102Inch8
    case iPad102Inch9
    case iPad109Inch10
    
    // iPad Mini
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadMini5
    case iPadMini6
    case iPadMini7
    
    // iPad Air
    case iPadAir1
    case iPadAir2
    case iPadAir3
    case iPadAir4
    case iPadAir5
    case iPadAir11Inch6
    case iPadAir13Inch6
    
    // iPad Pro
    case iPadPro129Inch1
    case iPadPro97Inch1
    case iPadPro105Inch2
    case iPadPro11Inch3
    case iPadPro129Inch3
    case iPadPro11Inch4
    case iPadPro129Inch4
    case iPadPro11Inch5
    case iPadPro129Inch5
    case iPadPro11Inch6
    case iPadPro129Inch6
            
    // MARK: Simulator
    case simulator
}
