//
//  DeviiceTests.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 17/03/25.
//  Copyright © 2025 Andrea Mario Lufino. All rights reserved.
//

import Testing
import Foundation
@testable import Deviice


struct DeviiceTests {
    
    @Test func validateJSON() async throws {
        
        let devices = try loadJSON()
        #expect(!devices.isEmpty)
    }
    
    @Test func validateModels() async throws {
        
        let devices = try loadJSON()
        try #require(devices.isEmpty == false, "Devices is empty")

        for device in devices.values {
            #expect(device.identifier.isEmpty == false)
            #expect(device.specificModel != .notMapped)
            if device.specificModel == .notMapped {
                print("Identifier \(device.identifier) is notMapped.")
            }
        }
    }
    
    @Test func validateNotMappedDevice() async throws {
        let unknown = Device(identifier: "iPad9999,9")
        #expect(unknown.specificModel == .notMapped)
        #expect(unknown.isNotMapped == true)
    }

    private func loadJSON() throws -> [String: Device] {

        let fileURL = Bundle.module.url(forResource: "devices", withExtension: "json")
        try #require(fileURL != nil)

        let data = try Data(contentsOf: fileURL!)
        let devices = try JSONDecoder().decode([String: Device].self, from: data)

        return devices
    }
}
