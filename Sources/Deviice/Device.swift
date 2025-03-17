//
//  Device.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 10/09/24.
//

import Foundation
import UIKit


public struct Device: Codable {
    
    public let identifier: String
    public let screenSize: Double
    public let year: Int
    public let marketingName: String
    public let specificModel: Model
    public let genericModel: String
    public let chip: String
    public let biometricSupport: String
    public let displayType: String
    public let connectivity: String
    public let portType: String
    public let hasUltraWide: Bool
    public let appleIntelligence: Bool
    
    public var isSimulator: Bool        { specificModel == .simulator }
    public var isNotSimulator: Bool     { !isSimulator }
    public var isNotMapped: Bool        { specificModel == .notMapped }
    public var simulatedDevice: Device? {
        if isSimulator {
            if let actualSimulatedDeviceIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                // actual simulated device here
                return Self.device(fromIdentifier: actualSimulatedDeviceIdentifier)
            }
        }
        return nil
    }
    
    public init(identifier: String? = nil) {
        let identifier = identifier ?? Self.identifier
        let device = Self.device(fromIdentifier: identifier)
        
        self.identifier = identifier
        self.screenSize = device?.screenSize ?? 0
        self.year = device?.year ?? 0
        self.marketingName = device?.marketingName ?? "-"
        self.genericModel = device?.genericModel ?? "-"
        self.specificModel = device?.specificModel ?? .notMapped
        self.chip = device?.chip ?? "-"
        self.biometricSupport = device?.biometricSupport ?? "-"
        self.displayType = device?.displayType ?? "-"
        self.connectivity = device?.connectivity ?? "-"
        self.portType = device?.portType ?? "-"
        self.hasUltraWide = device?.hasUltraWide ?? false
        self.appleIntelligence = device?.appleIntelligence ?? false
    }
    
    public static var current: Device? {
        return device(fromIdentifier: identifier)
    }
}


// MARK: - Private static methods

private extension Device {
    
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
    
    static func device(fromIdentifier identifier: String) -> Device? {
//        if let fileURL = Bundle(identifier: "org.cocoapods.Deviice")?.url(forResource: "devices", withExtension: "json") {
        if let fileURL = Bundle.module.url(forResource: "devices", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let newDevices = try JSONDecoder().decode([String: Device].self, from: data)
                
                return newDevices.first(where: { $0.key == identifier })?.value
            } catch {
                print("error \(error)")
            }
        }
        
        return nil
    }
}
