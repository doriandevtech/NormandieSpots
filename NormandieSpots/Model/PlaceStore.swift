//
//  PlaceStore.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 14/05/2024.
//

import SwiftUI

@MainActor
class PlaceStore: ObservableObject {
    @Published var places: [Place] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("places.data")
    }
    
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
    
    func save(places: [Place]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(places)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
