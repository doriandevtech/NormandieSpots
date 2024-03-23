//
//  Setting.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 22/03/2024.
//

import Foundation

// MARK: Setting
/// Main aspect: Setting struct - defines the blueprint (variables & methods) for the Setting type
struct Setting {
    
    //    MARK: Variables
    /// textSize is an Int defining the size for the text's font displayed on screen
    var textSize: Int
    /// textSizeAsDouble is a Double
    var textSizeAsDouble: Double {
        get {
            Double(textSize)
        }
        set {
            textSize = Int(newValue)
        }
    }
    
    var isColorLight: Bool
}

// MARK: Extension
extension Setting {
    static var sampleData: [Setting] {
        [
            Setting(textSize: 5, isColorLight: true)
        ]
    }
    
}
