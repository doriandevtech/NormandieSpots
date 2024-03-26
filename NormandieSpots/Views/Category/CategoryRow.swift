//
//  CategoryRow.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 08/12/2023.
//

// MARK: Imports
import SwiftUI /// Imports SwiftUI framework

// MARK: CategoryRow
/// Main aspect: CategoryRow shows the list of a places for s given category
struct CategoryRow: View {
    
    // MARK: Variables
    var categoryName: String /// categoryName: String - Category's name
    var placesList: [Place] /// placesList: [Place] - List of places
    var places = ModelData().places /// places: - Places
    
    // MARK: CategoryRow's View
    var body: some View {
        /// This VStack groups the category's name and a ScrollView of the linked places
        VStack {
            /// Category's name
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            /// ScrollView of the places inside this category
            ScrollView(.horizontal, showsIndicators: false) {
                /// This HStack contains a NavigationLink to a given place detailed informations
                HStack(alignment: .top, spacing: 0) {                    ForEach(placesList) { place in
                        NavigationLink { /// NavigationLink directing to a places informations
                            PlaceDetail(place: place) /// Opens PlaceDetail view for the given place
                        } label: {
                            CategoryItem(place: place) /// Shows the CategoryItem view for the given place
                        }
                    }
                }
            }
            .frame(height: 185) /// Sets the ScrollView's height
        }
    }
}

// MARK: Preview
/// Shows a preview of CategoryRow with default parameters
struct CategoryRow_Preview: PreviewProvider {
    static var places = ModelData().places
    
    /// Defines "previews" variable with a CategoryRow and default parameters
    static var previews: some View {
        CategoryRow(
            categoryName: places[0].category.rawValue,
            placesList: Array(ModelData().places.prefix(3)))
    }
}
