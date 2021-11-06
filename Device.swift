//
//  Device.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 05/11/21.
//

import Foundation


public struct Device {
    
    var screenSize: Size
    var connectivity: Connectivity
    var model: Model
    var family: Family
    var releaseYear: Int
    
    private static var identifier: String = {
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
    
    static var family: Family = {
        
        let id = identifier.lowercased()
        
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
        switch identifier {
        case "iPod1,1":
            
        }
    }()
}
