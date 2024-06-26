//
//  Model.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

// MARK: Imports
import Foundation
import Combine

// MARK: ModelData
/// Defines the Data Model of the app
final class ModelData: ObservableObject {
    
    // MARK: Variables
    /// `places`: [Place] - Array of landmarks initialized from landmarkData.json
    @Published var places: [Place] = load("placesDatas.json")
    
    /// `features`: [Place] - filters the favorite places
    var features: [Place] {
        places.filter { $0.isFeatured }
    }
    
    /// `categories`: [String: [Place]] - creates a Dictionary of places per category
    var categories: [String: [Place]] {
        Dictionary(
            grouping: places,
            by: { $0.category.rawValue }
        )
    }
}

// MARK: load()
/// `func load()` - Fetches JSON data with a given name from the app's main bundle
/// - Parameter filename: placesDatas.JSON -> datas for places displayed in the app
/// - Returns: datas decoded from the file passed in parameter
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't find \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
