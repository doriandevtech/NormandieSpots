//
//  Setting.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 22/03/2024.
//

// MARK: Imports
import Foundation

// MARK: Setting
/// Main aspect: Setting struct - defines the blueprint (variables & methods) for the Setting type
struct Setting {
    
    // MARK: Variables
    /// `textSize`: Int - Defines the size for the text's font displayed on screen
    var textSize: Int
    /// `textSizeAsDouble`: Double
    var textSizeAsDouble: Double {
        /// Get `textSize` and converts it into a Double
        get {
            Double(textSize)
        }
        /// Retrieve the slider's new value `newValue` converts it into a Int and affects it to `textSize`
        set {
            textSize = Int(newValue)
        }
    }
    
    /// Defines the color scheme of the app
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
