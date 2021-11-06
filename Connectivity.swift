//
//  Connectivity.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 05/11/21.
//

import Foundation


public enum Connectivity: String {
    case unknown        = "Unknown"
    case wiFi           = "WiFi"
    case wiFi3G         = "WiFi + 3G"
    case wiFi4G         = "WiFi + 4G"
    case wiFi5G         = "WiFi + 5G"
    
    static func get(_ identifier: String) -> Connectivity {
        switch identifier {
            case
            "iPod1,1",
            "iPod2,1",
            "iPod3,1",
            "iPod4,1",
            "iPod5,1",
            "iPod7,1",
            "iPod9,1",
            
            "iPad2,1",
            "iPad3,1",
            "iPad3,4",
            "iPad4,1",
            "iPad5,3",
            "iPad6,11",
            "iPad7,5",
            "iPad7,11",
            "iPad11,3",
            "iPad11,6",
            "iPad13,1",
            "iPad12,1":
            return .wiFi
        default:
            return .unknown
        }
    }
}
