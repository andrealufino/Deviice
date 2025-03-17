//
//  Device.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 10/09/24.
//

import Foundation
import UIKit


/// This struct represent a device in the physical sense.
public struct Device: Codable {
    
    /// This is the identifier of the device, such as `iPhone17,2`.
    public let identifier: String
    /// This is the screen size, in inch.
    public let screenSize: Double
    /// The year of release.
    public let year: Int
    /// The marketing name is the common name of the device.
    public let marketingName: String
    /// The specific model as a raw string, such as `iPhone16ProMax`.
    public let specificModelRaw: String
    /// The generic model of the device, such as `iPhone16`.
    public let genericModel: String
    /// The chip used in the device.
    public let chip: String
    /// The biometric support of the device.
    /// If the device has no biometric support, an empty string will be returned.
    public let biometricSupport: String
    /// The type of display the device uses.
    public let displayType: String
    /// The connectivity of the device.
    public let connectivity: String
    /// The port that the device uses.
    public let portType: String
    /// If the device has ultra wide camera.
    public let hasUltraWide: Bool
    /// If the device supports Apple Intelligence.
    public let appleIntelligence: Bool
    
    /// The specific model as `Model`. If it is not mapped, it will be `.notMapped`.
    public var specificModel: Model     { .init(rawValue: specificModelRaw) ?? .notMapped }
    /// If the device is a simulator.
    public var isSimulator: Bool        { specificModel == .simulator }
    /// If the device is not a simulator.
    public var isNotSimulator: Bool     { !isSimulator }
    /// If the device is an iPad.
    public var isiPad: Bool             { identifier.contains("iPad") }
    /// If the device is an iPhone.
    public var isiPhone: Bool           { identifier.contains("iPhone") }
    /// If the device is an iPod.
    public var isiPod: Bool             { identifier.contains("iPod") }
    /// If the device is not mapped to a `Model`.
    public var isNotMapped: Bool        { specificModel == .notMapped }
    /// If the device is a simulator, this will return the actual device being simulated.
    public var simulatedDevice: Device? {
        if isSimulator {
            if let actualSimulatedDeviceIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                // actual simulated device here
                return Self.device(fromIdentifier: actualSimulatedDeviceIdentifier)
            }
        }
        return nil
    }
    
    /// Init a new device.
    /// If `identifier` is not passed, a new device representing the current device will be created.
    /// - Parameter identifier: The identifier of the device to init. Default value is nil
    public init(identifier: String? = nil) {
        let identifier = identifier ?? Self.identifier
        let device = Self.device(fromIdentifier: identifier)
        
        self.identifier = identifier
        self.screenSize = device?.screenSize ?? 0
        self.year = device?.year ?? 0
        self.marketingName = device?.marketingName ?? "-"
        self.genericModel = device?.genericModel ?? "-"
        self.specificModelRaw = device?.specificModelRaw ?? "-"
        self.chip = device?.chip ?? "-"
        self.biometricSupport = device?.biometricSupport ?? "-"
        self.displayType = device?.displayType ?? "-"
        self.connectivity = device?.connectivity ?? "-"
        self.portType = device?.portType ?? "-"
        self.hasUltraWide = device?.hasUltraWide ?? false
        self.appleIntelligence = device?.appleIntelligence ?? false
    }
    
    /// The current device.
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
