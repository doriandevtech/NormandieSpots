//
//  NormandieSpotsApp.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

import SwiftUI

@main
struct NormandieSpotsApp: App {
    /// Creates a model instance and supply it to ContentView
    /// @State attribute initializes a model object the same way you use it to initialize properties inside a view
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
