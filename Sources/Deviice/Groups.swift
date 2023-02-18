//
//  Groups.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 07/11/21.
//

import Foundation


// MARK: - Groups

/// This structure is intended to offer groups of devices as static vars.
public struct Groups {
    
    /// Filter the `Model` using the passed string.
    /// - Parameter string: The string to use to filter the models.
    /// - Returns: An array of `Model` or an empty one. 
    private static func filterModels(_ string: String) -> [Model] {
        return Model.allCases.filter { String(describing: $0).lowercased().contains(string) }
    }
    
    /// All the iPods.
    public static var iPods: [Model] {
        filterModels("ipod")
    }
    
    /// All the iPhones.
    public static var iPhones: [Model] {
        filterModels("iphone")
    }
    
    /// All the iPads.
    public static var iPads: [Model] {
        filterModels("ipad")
    }
    
    /// All the plus sized devices.
    public static var plusDevices: [Model] {
        // All devices with plus or max word inside
        return filterModels("plus") + filterModels("max")
    }
    
    /// All the pro devices.
    public static var proDevices: [Model] {
        filterModels("pro")
    }
    
    /// All the mini devices.
    public static var miniDevices: [Model] {
        filterModels("mini")
    }
}
