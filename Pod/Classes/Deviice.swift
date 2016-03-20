//
//  Deviice.swift
//  Pods
//
//  Created by Andrea Mario Lufino on 20/03/16.
//
//

import Foundation

public enum DeviiceType {
    case Unknown
    case iPodTouch5
    case iPodTouch6
    case iPhone4
    case iPhone4s
    case iPhone5
    case iPhone5c
    case iPhone5s
    case iPhone6
    case iPhone6Plus
    case iPhone6s
    case iPhone6sPlus
    case iPad2
    case iPad3
    case iPad4
    case iPadAir
    case iPadAir2
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadPro
    case AppleTV
    case Simulator
}

public struct Deviice {
    
    public let identifier: String
    public let type: DeviiceType
    public let humanReadableName: String
    
    private init(identifier: String, type: DeviiceType, humanReadableName: String) {
        
        self.identifier = identifier
        self.type = type
        self.humanReadableName = humanReadableName
    }
    
    public static func currentDevice() -> Deviice {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 where value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
            
        case "iPod5,1":                                     return Deviice(identifier: identifier, type: .iPodTouch5, humanReadableName: "iPod Touch 5")
        case "iPod7,1":                                     return Deviice(identifier: identifier, type: .iPodTouch5, humanReadableName: "iPod Touch 6")
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":         return Deviice(identifier: identifier, type: .iPhone4, humanReadableName: "iPhone 4")
        case "iPhone4,1":                                   return Deviice(identifier: identifier, type: .iPhone4s, humanReadableName: "iPhone 4s")
        case "iPhone5,1", "iPhone5,2":                      return Deviice(identifier: identifier, type: .iPhone5, humanReadableName: "iPhone 5")
        case "iPhone5,3", "iPhone5,4":                      return Deviice(identifier: identifier, type: .iPhone5c, humanReadableName: "iPhone 5c")
        case "iPhone6,1", "iPhone6,2":                      return Deviice(identifier: identifier, type: .iPhone5s, humanReadableName: "iPhone 5s")
        case "iPhone7,2":                                   return Deviice(identifier: identifier, type: .iPhone6, humanReadableName: "iPhone 6")
        case "iPhone7,1":                                   return Deviice(identifier: identifier, type: .iPhone6Plus, humanReadableName: "iPhone 6 Plus")
        case "iPhone8,1":                                   return Deviice(identifier: identifier, type: .iPhone6s, humanReadableName: "iPhone 6s")
        case "iPhone8,2":                                   return Deviice(identifier: identifier, type: .iPhone6sPlus, humanReadableName: "iPhone 6s Plus")
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":    return Deviice(identifier: identifier, type: .iPad2, humanReadableName: "iPad 2")
        case "iPad3,1", "iPad3,2", "iPad3,3":               return Deviice(identifier: identifier, type: .iPad3, humanReadableName: "iPad 3")
        case "iPad3,4", "iPad3,5", "iPad3,6":               return Deviice(identifier: identifier, type: .iPad4, humanReadableName: "iPad 4")
        case "iPad4,1", "iPad4,2", "iPad4,3":               return Deviice(identifier: identifier, type: .iPadAir, humanReadableName: "iPad Air")
        case "iPad5,3", "iPad5,4":                          return Deviice(identifier: identifier, type: .iPadAir2, humanReadableName: "iPad Air 2")
        case "iPad2,5", "iPad2,6", "iPad2,7":               return Deviice(identifier: identifier, type: .iPadMini, humanReadableName: "iPad Mini")
        case "iPad4,4", "iPad4,5", "iPad4,6":               return Deviice(identifier: identifier, type: .iPadMini2, humanReadableName: "iPad Mini 2")
        case "iPad4,7", "iPad4,8", "iPad4,9":               return Deviice(identifier: identifier, type: .iPadMini3, humanReadableName: "iPad Mini 3")
        case "iPad5,1", "iPad5,2":                          return Deviice(identifier: identifier, type: .iPadMini4, humanReadableName: "iPad Mini 4")
        case "iPad6,7", "iPad6,8":                          return Deviice(identifier: identifier, type: .iPadPro, humanReadableName: "iPad Pro")
        case "AppleTV5,3":                                  return Deviice(identifier: identifier, type: .AppleTV, humanReadableName: "Apple TV")
        case "i386", "x86_64":                              return Deviice(identifier: identifier, type: .Simulator, humanReadableName: "Simulator")
        default:                                            return Deviice(identifier: identifier, type: .Unknown, humanReadableName: "Unknown")
        }
    }
}

extension Deviice: CustomStringConvertible {
    
    public var description: String {
        
        return "Deviice\nIdentifier: \(identifier)\nType: \(type)\nHuman readable name: \(humanReadableName)"
    }
}





