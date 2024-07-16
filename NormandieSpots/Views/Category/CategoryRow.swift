//
//  CategoryRow.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 08/12/2023.
//

// MARK: - Imports
import SwiftUI

// MARK: - CategoryRow
/// CategoryRow shows the list of a places for s given category
struct CategoryRow: View {
    
    // MARK: - Variables
    /// Category's name
    var categoryName: String
    /// List of places
    var placesList: [Place]
    /// List of places
    var places = ModelData().places
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {                           /// Groups the category's name and a ScrollView of the linked places
            Text(categoryName)
                .font(.title3)
                .padding(.init(top: 10, leading: 20, bottom: -5, trailing: 10))
            
            ScrollView(.horizontal, showsIndicators: false) {   /// ScrollView of the places inside this category
                HStack(alignment: .top, spacing: 0) {
                    ForEach(placesList) { place in              /// For each `place` from `placesList`
                        NavigationLink {
                            PlaceDetail(place: place)           /// Re-directs to PlaceDetail( ) view for the given place
                        } label: {
                            CategoryItem(place: place)          /// Shows the CategoryItem view for the given place
                        }
                    }
                }
            }
            .frame(height: 185) 
        }
    }
}

// MARK: - Preview
struct CategoryRow_Preview: PreviewProvider {
    static var places = ModelData().places
    
    static var previews: some View {
        CategoryRow(
            categoryName: places[0].category.rawValue,
            placesList: Array(ModelData().places.prefix(3)))
    }
}
