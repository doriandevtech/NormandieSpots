//
//  Place.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

// MARK: - Imports
import Foundation
import SwiftUI
import CoreLocation

// MARK: - Place
/// Defines properties and structures for a given 'Place'
struct Place: Hashable, Codable, Identifiable {
    
    // MARK: - Variables
    /// Place's `id`
    var id: Int
    /// Place's `name`
    var name: String
    /// Place's `country`
    var country: String
    /// Place's `description`
    var description: String
    /// Place's `isFavorite`
    var isFavorite: Bool
    /// Place's `isFeatured` attribute
    var isFeatured: Bool
    /// Place's `category`
    var category: Category
    
    /// Place's initialization
    init(
        id: Int,
        name: String,
        country: String,
        description: String,
        isFavorite: Bool,
        isFeatured: Bool,
        category: Category,
        imageName: String,
        coordinates: Coordinates
    ) {
        self.id = id
        self.name = name
        self.country = country
        self.description = description
        self.isFavorite = isFavorite
        self.isFeatured = isFeatured
        self.category = category
        self.imageName = imageName
        self.coordinates = coordinates
    }
    
    /// `Category`: String, CaseIterable, Codable - Place's category enum
    enum Category: String, Codable {
        case ville = "Ville"
        case commune = "Commune"
        case monument = "Monument"
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

// MARK: - Extensions
extension Place {
    /// An empty Place's declaration
    static var emptyPlace: Place {
        Place(
            id: 0,
            name: "",
            country: "",
            description: "",
            isFavorite: false,
            isFeatured: false,
            category: Category.commune,
            imageName: "",
            coordinates: Coordinates(latitude: 1.0, longitude: 1.0)
        )
    }
}

extension Place {
    /// A list of pre recorded Places used as examples during build time
    static var sampleData: [Place] {
        [
            Place(
                id: 1,
                name: "Name",
                country: "Country",
                description: "Description",
                isFavorite: true,
                isFeatured: true,
                category: Category.ville,
                imageName: "",
                coordinates: Coordinates(latitude: 0.0, longitude: 0.0)
            )
        ]
    }
    
}
