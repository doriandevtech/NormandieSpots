//
//  PlaceStore.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 14/05/2024.
//

// MARK: - Imports
import SwiftUI

// MARK: - PlaceStore
@MainActor /// Make the `PlaceStore` class as the starting point of the app NormandieSpots
class PlaceStore: ObservableObject {
    
    // MARK: - Variables
    /// Array of `places`
    @Published var places: [Place] = []
    
    // MARK: - Functions
    /// Declares a file "places.data" to store datas
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("places.data")
    }
    
    /// Loads the datas from a given file
    func load() async throws {
        let task = Task<[Place], Error>{
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let placesList = try JSONDecoder().decode([Place].self, from: data)
            return placesList
        }
        let places = try await task.value
        self.places = places
    }
    
    /// Saves data to a given file
    func save(places: [Place]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(places)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
