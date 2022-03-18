//
//  Group.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 07/11/21.
//

import Foundation


public struct Group {
    
    static var all: [Identifier] = {
        return Identifier.allCases
    }()
    
    static var simulators: [Identifier] = {
        return [
            .i386,
            .x86_64,
            .arm64
        ]
    }()
    
    static var iPods: [Identifier] = {
        return [
            .iPod1_1,
            .iPod2_1,
            .iPod3_1,
            .iPod4_1,
            .iPod5_1,
            .iPod7_1,
            .iPod9_1
        ]
    }()
    
    static var iPhones: [Identifier] = {
        return [
            .iPhone1_1,
            .iPhone1_2,
            .iPhone2_1,
            .iPhone3_1,
            .iPhone3_2,
            .iPhone3_3,
            .iPhone4_1,
            .iPhone5_1,
            .iPhone5_2,
            .iPhone5_3,
            .iPhone5_4,
            .iPhone6_1,
            .iPhone6_2,
            .iPhone7_1,
            .iPhone7_2,
            .iPhone8_1,
            .iPhone8_2,
            .iPhone8_4,
            .iPhone9_1,
            .iPhone9_2,
            .iPhone9_3,
            .iPhone9_4,
            .iPhone10_1,
            .iPhone10_2,
            .iPhone10_3,
            .iPhone10_4,
            .iPhone10_5,
            .iPhone10_6,
            .iPhone11_2,
            .iPhone11_4,
            .iPhone11_6,
            .iPhone11_8,
            .iPhone12_1,
            .iPhone12_3,
            .iPhone12_5,
            .iPhone12_8,
            .iPhone13_1,
            .iPhone13_2,
            .iPhone13_3,
            .iPhone13_4,
            .iPhone14_2,
            .iPhone14_3,
            .iPhone14_4,
            .iPhone14_5
        ]
    }()
    
    static var iPads: [Identifier] = {
        return [
            // MARK: iPad
            .iPad2_1,
            .iPad2_2,
            .iPad2_3,
            .iPad2_4,
            .iPad3_1,
            .iPad3_2,
            .iPad3_3,
            .iPad3_4,
            .iPad3_5,
            .iPad3_6,
            .iPad4_1,
            .iPad4_2,
            .iPad4_3,
            .iPad5_3,
            .iPad5_4,
            .iPad6_11,
            .iPad6_12,
            .iPad7_5,
            .iPad7_6,
            .iPad7_11,
            .iPad7_12,
            .iPad11_3,
            .iPad11_4,
            .iPad11_6,
            .iPad11_7,
            .iPad12_1,
            .iPad12_2,
            .iPad13_1,
            .iPad13_2,
            // MARK: iPad mini
            .iPad2_5,
            .iPad2_6,
            .iPad2_7,
            .iPad4_4,
            .iPad4_5,
            .iPad4_6,
            .iPad4_7,
            .iPad4_8,
            .iPad4_9,
            .iPad5_1,
            .iPad5_2,
            .iPad11_1,
            .iPad11_2,
            .iPad14_1,
            .iPad14_2,
            // MARK: iPad Pro
            .iPad6_3,
            .iPad6_4,
            .iPad6_7,
            .iPad6_8,
            .iPad7_1,
            .iPad7_2,
            .iPad7_3,
            .iPad7_4,
            .iPad8_1,
            .iPad8_2,
            .iPad8_3,
            .iPad8_4,
            .iPad8_5,
            .iPad8_6,
            .iPad8_7,
            .iPad8_8,
            .iPad8_9,
            .iPad8_10,
            .iPad8_11,
            .iPad8_12,
            .iPad13_4,
            .iPad13_5,
            .iPad13_6,
            .iPad13_7,
            .iPad13_8,
            .iPad13_9,
            .iPad13_10,
            .iPad13_11
        ]
    }()
    
    static var wiFiDevices: [Identifier] = {
        return [
            // MARK: iPods
            .iPod1_1, .iPod2_1, .iPod3_1, .iPod4_1,
            .iPod5_1,.iPod7_1, .iPod9_1,
            // MARK: iPads
            .iPad2_1, .iPad3_1, .iPad3_4, .iPad4_1,
            .iPad5_3, .iPad6_11, .iPad7_5, .iPad7_11,
            .iPad11_3, .iPad11_6, .iPad13_1, .iPad12_1,
            // MARK: iPad Pros
            .iPad6_3, .iPad6_7, .iPad7_1, .iPad7_3,
            .iPad8_1, .iPad8_2, .iPad8_5, .iPad8_6,
            .iPad8_9, .iPad8_11, .iPad13_4, .iPad13_5,
            .iPad13_8, .iPad13_9,
            // MARK: iPad minis
            .iPad2_5,
            .iPad4_4,
            .iPad4_7,
            .iPad5_1,
            .iPad11_1,
            .iPad14_1
        ]
    }()
    
    static var cellularDevices: [Identifier] = {
        return [
            // MARK: iPhones
            .iPhone1_1,
            .iPhone1_2,
            .iPhone2_1,
            .iPhone3_1,
            .iPhone3_2,
            .iPhone3_3,
            .iPhone4_1,
            .iPhone5_1,
            .iPhone5_2,
            .iPhone5_3,
            .iPhone5_4,
            .iPhone6_1,
            .iPhone6_2,
            .iPhone7_1,
            .iPhone7_2,
            .iPhone8_1,
            .iPhone8_2,
            .iPhone8_4,
            .iPhone9_1,
            .iPhone9_2,
            .iPhone9_3,
            .iPhone9_4,
            .iPhone10_1,
            .iPhone10_2,
            .iPhone10_3,
            .iPhone10_4,
            .iPhone10_5,
            .iPhone10_6,
            .iPhone11_2,
            .iPhone11_4,
            .iPhone11_6,
            .iPhone11_8,
            .iPhone12_1,
            .iPhone12_3,
            .iPhone12_5,
            .iPhone12_8,
            .iPhone13_1,
            .iPhone13_2,
            .iPhone13_3,
            .iPhone13_4,
            .iPhone14_2,
            .iPhone14_3,
            .iPhone14_4,
            .iPhone14_5,
            // MARK: iPads
            .iPad2_2,
            .iPad2_3,
            .iPad2_4,
            .iPad3_2,
            .iPad3_3,
            .iPad3_5,
            .iPad3_6,
            .iPad4_2,
            .iPad4_3,
            .iPad5_4,
            .iPad6_12,
            .iPad7_6,
            .iPad7_12,
            .iPad11_4,
            .iPad11_7,
            .iPad13_2,
            .iPad12_2,
            // MARK: iPad Pros
            .iPad6_4,
            .iPad6_8,
            .iPad7_2,
            .iPad7_4,
            .iPad8_3,
            .iPad8_7,
            .iPad8_8,
            .iPad8_10,
            .iPad8_12,
            .iPad13_6,
            .iPad13_7,
            .iPad13_10,
            .iPad13_11,
            // MARK: iPad minis
            .iPad2_6,
            .iPad2_7,
            .iPad4_5,
            .iPad4_6,
            .iPad4_8,
            .iPad4_9,
            .iPad5_2,
            .iPad11_2,
            .iPad14_2,
            // MARK: Simulator
            .i386,
            .x86_64,
            .arm64
        ]
    }()
}
