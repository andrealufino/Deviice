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
        
        let fileURL = Bundle.module.url(forResource: "devices", withExtension: "json")
        try #require(fileURL != nil)
        do {
            let data = try Data(contentsOf: fileURL!)
            let devices = try JSONDecoder().decode([String: Device].self, from: data)
            
            #expect(devices != nil)
        } catch {
            print("error \(error)")
            throw error
        }
    }
    
    @Test func validateModels() async throws {
        
        let fileURL = Bundle.module.url(forResource: "devices", withExtension: "json")
        try #require(fileURL != nil)
        let data = try Data(contentsOf: fileURL!)
        let devices = try JSONDecoder().decode([String: Device].self, from: data)
        try #require(devices != nil, "Devices is nil")
        try #require(devices.isEmpty == false, "Devices is empty")
        
        for device in devices.values {
            print("Identifier: \(device.identifier) - Model: \(device.specificModel)")
            #expect(device.identifier.isEmpty == false)
            #expect(device.specificModel != .notMapped)
        }
    }
}
