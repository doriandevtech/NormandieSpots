//
//  Place.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

// MARK: Imports
import Foundation /// Imports Foundation
import SwiftUI /// Imports SwiftUI framework
import CoreLocation /// Imports CoreLocation

// MARK: Place
/// Defines properties and structures for a given 'Place'
struct Place: Hashable, Codable, Identifiable {
    
    // MARK: Variables
    var id: Int /// `id`: Int - Place's id
    var name: String /// `id`: String - Place's name
    var country: String /// `id`: String - Place's country
    var description: String /// `id`: String - Place's description
    var isFavorite: Bool /// `id`: Bool - Place's `isFavorite` attribute
    var isFeatured: Bool /// `id`: Bool - Place's `isFeatured` attribute
    var category: Category /// `id`: Category - Place's catgeory
    
    /// `Category`: String, CaseIterable, Codable - Place's category enum
    enum Category: String, Codable {
        case ville = "Ville"
        case commune = "Commune"
    }
    
    /// `imageName`: String - Image declaration
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    /// `coordinates`: Coordinates - Location handler
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    /// `Coordinates`: struct defining coordinates stored in `placesData.JSON`
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
