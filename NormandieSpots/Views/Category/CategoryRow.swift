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
    /// categoryName: String - Category's name
    var categoryName: String
    /// placesList: [Place] - List of places
    var placesList: [Place]
    /// places: [Place] - List of places
    var places = ModelData().places
    
    // MARK: CategoryRow's View
    var body: some View {
        
        /// Groups the category's name and a ScrollView of the linked places
        VStack(alignment: .leading) {
            
            /// Category's name
            Text(categoryName)
                .font(.title3)
                .padding()
            
            /// ScrollView of the places inside this category
            ScrollView(.horizontal, showsIndicators: false) {
                
                /// Contains a NavigationLink to a given place detailed informations
                HStack(alignment: .top, spacing: 0) {
                    
                    ForEach(placesList) { place in
                        
                        /// NavigationLink directing to a places informations
                        NavigationLink {
                            
                            /// Opens PlaceDetail view for the given place
                            PlaceDetail(place: place)
                            
                        } label: {
                            
                            /// Shows the CategoryItem view for the given place
                            CategoryItem(place: place)
                            
                        }
                    }
                }
            }
            .frame(height: 185) /// ScrollView's height
        }
    }
}

// MARK: Preview
struct CategoryRow_Preview: PreviewProvider {
    static var places = ModelData().places
    
    static var previews: some View {
        CategoryRow(
            categoryName: places[0].category.rawValue,
            placesList: Array(ModelData().places.prefix(3)))
    }
}
