//
//  NewDevice.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 10/09/24.
//

import Foundation
import UIKit


/// This is the model of the device.
public enum NewModel: String, Codable {
    
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
    
    // iPad generici
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


public struct NewDevice: Codable {
    
    public let identifier: String
    public let screenSize: Double
    public let year: Int
    public let marketingName: String
    public let model: NewModel
    public let genericModel: String?
    public let specificModel: String?
    public let chip: String?
    public let biometricSupport: String?
    public let displayType: String?
    public let connectivity: String?
    public let portType: String?
    public let hasUltraWide: Bool?
    public let appleIntelligence: Bool?
    
    public var isSimulator: Bool        { model == .simulator }
    public var isNotSimulator: Bool     { !isSimulator }
    public var isNotMapped: Bool        { model == .notMapped }
    public var simulatedDevice: NewDevice? {
        if isSimulator {
            if let actualSimulatedDeviceIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                // actual simulated device here
                return Self.device(fromIdentifier: actualSimulatedDeviceIdentifier)
            }
        }
        return nil
    }
    
    public init(identifier: String? = nil) {
        var identifier = identifier ?? Self.identifier
        let device = Self.device(fromIdentifier: identifier)
        
        self.identifier = identifier
        self.screenSize = device?.screenSize ?? 0
        self.year = device?.year ?? 0
        self.marketingName = device?.marketingName ?? ""
        self.model = device?.model ?? .notMapped
        self.genericModel = device?.genericModel
        self.specificModel = device?.specificModel
        self.chip = device?.chip
        self.biometricSupport = device?.biometricSupport
        self.displayType = device?.displayType
        self.connectivity = device?.connectivity
        self.portType = device?.portType
        self.hasUltraWide = device?.hasUltraWide
        self.appleIntelligence = device?.appleIntelligence
    }
    
    public static var current: NewDevice? {
        return device(fromIdentifier: identifier)
    }
}


// MARK: - Private static methods

private extension NewDevice {
    
    /// This is the raw identifier, as `String`.
    static var identifier: String {
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
    
    static func device(fromIdentifier identifier: String) -> NewDevice? {
//        if let fileURL = Bundle(identifier: "org.cocoapods.Deviice")?.url(forResource: "devices", withExtension: "json") {
        if let fileURL = Bundle.module.url(forResource: "devices", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let newDevices = try JSONDecoder().decode([String: NewDevice].self, from: data)
                
                return newDevices.first(where: { $0.key == identifier })?.value
            } catch {
                print("error \(error)")
            }
        }
        
        return nil
    }
}
