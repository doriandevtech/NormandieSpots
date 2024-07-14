//
//  CategoryItem.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 08/12/2023.
//

// MARK: - Imports
import SwiftUI

// MARK: - CategoryItem
/// Contains a VStack of a given place's image and a HStack with its name and isFavorite value
struct CategoryItem: View {
    
    // MARK: - Variables
    /// place` declaration
    var place: Place
    
    // MARK: - View
    /// Contains a VStack of the `place` image and a HStack with its name and `isFavorite` value
    var body: some View {
        VStack(alignment: .leading) {
            place.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 2)
            
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
        .padding(.leading, 15)
    }
}

// MARK: - Preview
#Preview {
    CategoryItem(place: ModelData().places[0])
}
