//
//  Device.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 05/11/21.
//

import Foundation
import CoreVideo
import UIKit


public struct Device {
    
    var screenSize: ScreenSize
    
    private static var rawIdentifier: String = {
        // Credits to Dennis Weissmann for this snippet
        // https://github.com/dennisweissmann
        // Here his snippet : https://github.com/dennisweissmann/DeviceKit/blob/master/Source/Device.swift#L177-L185
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return identifier
    }()
}

public extension Device {
    
    static var isPod: Bool {
        return family == .iPodTouch
    }
    
    static var isPhone: Bool {
        return family == .iPhone
    }
    
    static var isPad: Bool {
        return family == .iPad
    }
    
    static var isSimulator: Bool {
        return family == .simulator
    }
    
    static var isRetina: Bool {
        return UIScreen.main.scale > 1.0
    }
    
    static var isWiFiOnly: Bool {
        return Group.wiFiOnlyDevices.contains(Identifier.current)
    }
    
    static var isCellular: Bool {
        return Group.cellularDevices.contains(Identifier.current)
    }
}

public extension Device {
    
    static var family: Family = {
        
        let id = rawIdentifier.lowercased()
        
        if id.contains("ipod") {
            return .iPodTouch
        } else if id.contains("iphone") {
            return .iPhone
        } else if id.contains("ipad") {
            return .iPad
        } else {
            return .unknown
        }
    }()
    
    static var connectivity: Connectivity = {
        let current = Identifier.current
        
        switch current {
        case _ where Group.wiFiOnlyDevices.contains(current):
            return .wiFi
        case _ where Group.cellularDevices.contains(current):
            return .cellular
        default:
            return .unknown
        }
    }()
}

public extension Device {
    
    static var model: Model = {
        let current = Identifier.current
        
        switch current {
        // MARK: iPods
        case .iPod1_1:                                      return .iPodTouch1
        case .iPod2_1:                                      return .iPodTouch2
        case .iPod3_1:                                      return .iPodTouch3
        case .iPod4_1:                                      return .iPodTouch4
        case .iPod5_1:                                      return .iPodTouch5
        case .iPod7_1:                                      return .iPodTouch6
        case .iPod9_1:                                      return .iPodTouch7
        // MARK: iPhones
        case .iPhone1_1:                                    return .iPhone2G
        case .iPhone1_2:                                    return .iPhone3G
        case .iPhone2_1:                                    return .iPhone3GS
        case .iPhone3_1, .iPhone3_2, .iPhone3_3:            return .iPhone4
        case .iPhone4_1:                                    return .iPhone4S
        case .iPhone5_1, .iPhone5_2:                        return .iPhone5
        case .iPhone5_3, .iPhone5_4:                        return .iPhone5C
        case .iPhone6_1, .iPhone6_2:                        return .iPhone5S
        case .iPhone7_1:                                    return .iPhone6Plus
        case .iPhone7_2:                                    return .iPhone6
        case .iPhone8_1:                                    return .iPhone6S
        case .iPhone8_2:                                    return .iPhone6sPlus
        case .iPhone8_4:                                    return .iPhoneSE
        case .iPhone9_1, .iPhone9_3:                        return .iPhone7
        case .iPhone9_2, .iPhone9_4:                        return .iPhone7Plus
        case .iPhone10_1, .iPhone10_4:                      return .iPhone8
        case .iPhone10_2, .iPhone10_5:                      return .iPhone8Plus
        case .iPhone10_3,.iPhone10_6:                       return .iPhoneX
        case .iPhone11_2:                                   return .iPhoneXS
        case .iPhone11_4, .iPhone11_6:                      return .iPhoneXsMax
        case .iPhone11_8:                                   return .iPhoneXr
        case .iPhone12_1:                                   return .iPhone11
        case .iPhone12_3:                                   return .iPhone11Pro
        case .iPhone12_5:                                   return .iPhone11ProMax
        case .iPhone12_8:                                   return .iPhoneSE2
        case .iPhone13_1:                                   return .iPhone12Mini
        case .iPhone13_2:                                   return .iPhone12
        case .iPhone13_3:                                   return .iPhone12Pro
        case .iPhone13_4:                                   return .iPhone12ProMax
        case .iPhone14_2:                                   return .iPhone13Pro
        case .iPhone14_3:                                   return .iPhone13ProMax
        case .iPhone14_4:                                   return .iPhone13Mini
        case .iPhone14_5:                                   return .iPhone13
        case .iPhone14_6:                                   return .iPhoneSE3
        // MARK: iPads
        case .iPad2_1, .iPad2_2, .iPad2_3, .iPad2_4:        return .iPad2
        case .iPad3_1, .iPad3_2, .iPad3_3:                  return .iPad3
        case .iPad3_4, .iPad3_5, .iPad3_6:                  return .iPad4
        case .iPad4_1, .iPad4_2, .iPad4_3:                  return .iPadAir
        case .iPad5_3, .iPad5_4:                            return .iPadAir2
        case .iPad6_11, .iPad6_12:                          return .iPad5
        case .iPad7_5, .iPad7_6:                            return .iPad6
        case .iPad7_11, .iPad7_12:                          return .iPad7
        case .iPad11_3, .iPad11_4:                          return .iPadAir3
        case .iPad11_6, .iPad11_7:                          return .iPad8
        case .iPad12_1, .iPad12_2:                          return .iPad9
        case .iPad13_1, .iPad13_2:                          return .iPadAir4
        case .iPad13_16, .iPad13_17:                        return .iPadAir5
        // MARK: iPad minis
        case .iPad2_5, .iPad2_6, .iPad2_7:                  return .iPadMini
        case .iPad4_4, .iPad4_5, .iPad4_6:                  return .iPadMini2
        case .iPad4_7, .iPad4_8, .iPad4_9:                  return .iPadMini3
        case .iPad5_1, .iPad5_2:                            return .iPadMini4
        case .iPad11_1, .iPad11_2:                          return .iPadMini5
        case .iPad14_1, .iPad14_2:                          return .iPadMini6
        // MARK: iPad Pros
        case .iPad6_3, .iPad6_4, .iPad6_7, .iPad6_8:        return .iPadPro
        case .iPad7_1, .iPad7_2, .iPad7_3, .iPad7_4:        return .iPadPro2
        case .iPad8_1, .iPad8_2, .iPad8_3, .iPad8_4,
             .iPad8_5, .iPad8_6, .iPad8_7, .iPad8_8:        return .iPadPro3
        case .iPad8_9, .iPad8_10, .iPad8_11, .iPad8_12:     return .iPadPro4
        case .iPad13_4, .iPad13_5, .iPad13_6, .iPad13_7,
             .iPad13_8, .iPad13_9, .iPad13_10, .iPad13_11:  return .iPadPro5
        // MARK: Simulators
        case .i386, .x86_64, .arm64:                        return .simulator
        default:                                            return .unknown
        }
    }()
}
