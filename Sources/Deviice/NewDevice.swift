//
//  NewDevice.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 10/09/24.
//

import Foundation
import UIKit


public struct NewDevice: Codable {
    
    public let identifier: String
    public let screenSize: Double
    public let year: Int
    public let marketingName: String
    public let debugName: String
    
    public static var current: NewDevice? {
        let identifier = UIDevice.current.rawIdentifier
        if let fileURL = Bundle(identifier: "org.cocoapods.Deviice")?.url(forResource: "devices", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let newDevice = try JSONDecoder().decode([NewDevice].self, from: data)
                
                return newDevice.first(where: { $0.identifier == identifier })
            } catch {
                print("error \(error)")
            }
        }
        
        return nil
    }
}


extension UIDevice {
    
    /// This is the raw identifier, as `String`.
    var rawIdentifier: String {
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
    }
}
