//
//  Device.swift
//  Deviice
//
//  Created by Andrea Mario Lufino on 05/11/21.
//

import Foundation
import CoreVideo
#if os(watchOS)
import WatchKit
#else
import UIKit
#endif


// MARK: - Device

/// This class represents the current device.
public class Device {
    
    public let identifier: Identifier
    public private(set) var family: Family
//    private(set) var connectivity: Connectivity
    public private(set) var model: Model
    public private(set) var screenSize: ScreenSize
    
    public init(identifier: Identifier? = nil) {
        
        self.identifier = identifier ?? Identifier.current
        
        let id = self.identifier
        
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
    
    var actualModel: Model {
        
        switch model {
        case .simulator(let model):
            return model
        default:
            return model
        }
    }
    
    var name: String {
        
        #if os(watchOS)
        return WKInterfaceDevice.current().name
        #else
        return UIDevice.current.name
        #endif
    }
    
    public var osName: String {
        
      #if os(watchOS)
      return WKInterfaceDevice.current().systemName
      #else
      return UIDevice.current.systemName
      #endif
    }
    
    public var osVersion: String? {
      
      #if os(watchOS)
      return WKInterfaceDevice.current().systemVersion
      #else
      return UIDevice.current.systemVersion
      #endif
    }
}
