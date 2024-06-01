//
//  CategoryItem.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 08/12/2023.
//

// MARK: Imports
import SwiftUI

// MARK: CategoryItem
/// CategoryItem: View - contains a VStack of a given place's image and a HStack with its name and isFavorite value
struct CategoryItem: View {
    
    // MARK: Variables
    /// `place`: Place - `place` declaration
    var place: Place
    
    // MARK: CategoryItem's view
    /// body: View - contains a VStack of the `place` image and a HStack with its name and `isFavorite` value
    var body: some View {
        VStack(alignment: .leading) {
            place.image /// `place` image
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 2)
                
            HStack { /// Contains the `place` name and its `isFavorite` value
                Text(place.name)
                    .foregroundStyle(.primary)
                .font(.caption)
                if place.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
        }
        .padding(.leading, 15) /// Adds padding to the left of the VStack
    }
}

// MARK: Preview
#Preview {
    CategoryItem(place: ModelData().places[0])
}
