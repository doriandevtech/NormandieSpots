//
//  NormandieSpotsApp.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

import SwiftUI

@main
struct NormandieSpotsApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
