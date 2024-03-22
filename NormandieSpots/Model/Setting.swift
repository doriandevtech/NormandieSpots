//
//  Setting.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 22/03/2024.
//

import Foundation

struct Setting {
    var textSize: Int
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

extension Setting {
    static var sampleData: [Setting] {
        [
            Setting(textSize: 1, isColorLight: true)
        ]
    }
    
}
