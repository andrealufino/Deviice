//
//  DeviiceTests.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 17/03/25.
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
        #expect(devices.isEmpty == false, "Devices is empty")

        for device in devices.values {
//            print("Identifier: \(device.identifier) - Model: \(device.specificModel)")
            #expect(device.identifier.isEmpty == false)
            if device.identifier != "iPad8080,8" {
                #expect(device.specificModel != .notMapped)
                if device.specificModel == .notMapped {
                    print("Identifier \(device.identifier) is notMapped.")
                }
            }
        }
    }
    
    @Test func validateNotMappedDevice() async throws {
        
        let devices = try loadJSON()
        #expect(devices.isEmpty == false, "Devices is empty")

        guard let iPad8080 = devices["iPad8080,8"] else {
            Issue.record()
            return
        }

        print(iPad8080)
        #expect(iPad8080.specificModel == .notMapped)
        #expect(iPad8080.specificModelRaw == "iPad8080")
    }

    private func loadJSON() throws -> [String: Device] {

        let fileURL = Bundle.module.url(forResource: "devices", withExtension: "json")
        try #require(fileURL != nil)

        let data = try Data(contentsOf: fileURL!)
        let devices = try JSONDecoder().decode([String: Device].self, from: data)

        return devices
    }
}
