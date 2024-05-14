//
//  PlaceStore.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 14/05/2024.
//

import Foundation

class PlaceStore: ObservableObject {
    @Published var places: [PlaceList] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("places.data")
    }
}
