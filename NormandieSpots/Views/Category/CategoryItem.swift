//
//  CategoryItem.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 08/12/2023.
//

// MARK: Imports
import SwiftUI /// Imports SwiftUI framework

// MARK: CategoryItem
/// Main aspect: CategoryItem contains a VStack of a given place's image and a HStack with its name and isFavorite value
struct CategoryItem: View {
    
    // MARK: Variables
    var place: Place /// place: Place - place's declaration
    
    // MARK: CategoryItem's view
    /// "body" contains a VStack of the place's image and a HStack with its name and isFavorite value
    var body: some View {
        VStack(alignment: .leading) {
            /// places image
            place.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 2)
                
            /// This HStsck contains the place's name and its isFavorite value
            HStack {
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
