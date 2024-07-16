//
//  PlaceRow.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 09/11/2023.
//

// MARK: - Imports
import SwiftUI

// MARK: - PlaceRow
/// Main aspect : PlaceRow defines a lonely item
/// sub aspects :
/// - Its name, picture are shown by default
/// - A ⭐️ (star) can be shown if the place is in the "favorite" list
struct PlaceRow: View {
    
    // MARK: - Variables
    /// `place`: Place - place's declaration
    var place: Place
    
    // MARK: - View
    var body: some View {
        /// Shows the `place` image and it's `name` horizontally
        HStack {
            place.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle()) /// Renders the image as a circle
            Text(place.name)
            
            Spacer()
            
            /// Shows a yellow ⭐️ (star) if the `place` is "favorite"
            if place.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

// MARK: - Preview
struct PlaceRow_Previews: PreviewProvider {
    static var places = ModelData().places
    
    static var previews: some View {
        Group {
            PlaceRow(place: places[0])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
