//
//  Model.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

import Foundation
import Combine

/// Defines the Data Model of the app
final class ModelData: ObservableObject {
    
    /// Array of landmarks initialized from landmarkData.json
    @Published var places: [Place] = load("placesDatas.json")
}


/// Fetches JSON data with a given name from the app's main bundle
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
