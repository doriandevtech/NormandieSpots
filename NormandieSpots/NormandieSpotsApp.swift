//
//  NormandieSpotsApp.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

// MARK: - Imports
import SwiftUI


// MARK: - NormandieSpotsApp
/// Defines the entry point of the NormandieSpotsApp
@main
struct NormandieSpotsApp: App {
    
    // MARK: - Variables
    /// Creates a model instance and supply it to ContentView
    /// @State attribute initializes a model object the same way you use it to initialize properties inside a view
    @StateObject private var modelData = ModelData()
    @StateObject private var store = PlaceStore()
    
    // MARK: - View
    var body: some Scene {
        WindowGroup {
            ContentView(places: $store.places) {
                Task {
                    do {
                        try await store.save(places: modelData.places)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
            .environmentObject(modelData)
        }
    }
}
