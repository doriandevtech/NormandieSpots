//
//  NormandieSpotsApp.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

// MARK: Imports
import SwiftUI

@main /// @main - defines the entry point of the NormandieSpotsApp
struct NormandieSpotsApp: App {
    /// Creates a model instance and supply it to ContentView
    /// @State attribute initializes a model object the same way you use it to initialize properties inside a view
    @StateObject private var modelData = ModelData()
    @StateObject private var store = PlaceStore()
        
    var body: some Scene {
        WindowGroup {
            ContentView(places: $store.places)
                .environmentObject(modelData)
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
