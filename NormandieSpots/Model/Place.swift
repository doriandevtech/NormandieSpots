//
//  Place.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

import Foundation /// Imports Foundation
import SwiftUI /// Imports SwiftUI framework
import CoreLocation /// Imports CoreLocation

/// Defines properties and structures for a given 'Place'
struct Place: Hashable, Codable, Identifiable {
    /// Places main properties declaration
    var id: Int
    var name: String
    var country: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var category: Category
    
    /// Place's category enum
    enum Category: String, CaseIterable, Codable {
        case ville = "Ville"
        case commune = "Commune"
    }
    
    /// Image declaration
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    /// Location handler
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    /// Coordinates structure reflecting coordinates stored in placesData.JSON
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
