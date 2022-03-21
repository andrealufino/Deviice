//
//  Device.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 05/11/21.
//

import Foundation
import CoreVideo
import UIKit


// MARK: - Device

/// This class represents the current device.
public class Device {
    
    let identifier: Identifier
    private(set) var family: Family
    private(set) var connectivity: Connectivity
    private(set) var model: Model
    private(set) var screenSize: ScreenSize
    
    public init(identifier: Identifier? = nil) {
        
        self.identifier = identifier ?? Identifier.current
        
        let id = self.identifier
        
        connectivity = Mapper.connectivity(from: id)
        family = Mapper.family(from: id)
        model = Mapper.model(from: id)
        screenSize = Mapper.screenSize(from: model)
    }
}


// MARK: - Device info

public extension Device {
    
    var isPod: Bool {
        return family == .iPodTouch
    }
    
    var isPhone: Bool {
        return family == .iPhone
    }
    
    var isPad: Bool {
        return family == .iPad
    }
    
    var isSimulator: Bool {
        return family == .simulator
    }
    
    var isRetina: Bool {
        return UIScreen.main.scale > 1.0
    }
}
