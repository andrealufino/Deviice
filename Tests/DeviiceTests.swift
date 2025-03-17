//
//  DeviiceTests.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 17/03/25.
//

import Testing
import Foundation
@testable import Deviice

@Test func testJSON() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    
    
    if let fileURL = Bundle.module.url(forResource: "devices", withExtension: "json") {
        do {
            let data = try Data(contentsOf: fileURL)
            let newDevices = try JSONDecoder().decode([String: Device].self, from: data)
            
            for device in newDevices.values {
                #expect(device.model != .notMapped)
            }
        } catch {
            print("error \(error)")
        }
    }
}

