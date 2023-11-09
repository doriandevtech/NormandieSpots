//
//  Place.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

import Foundation
import SwiftUI
import CoreLocation

/// Defines properties and structures for a given 'Place'
struct Place: Hashable, Codable, Identifiable {
    /// Main properties
    var id: Int
    var name: String
    var category: String
    var country: String
    var description: String
    var isFavorite: Bool
    
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
