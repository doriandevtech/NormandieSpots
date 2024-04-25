//
//  FavoriteButton.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 09/11/2023.
//

// MARK: Imports
import SwiftUI

// MARK: FavoriteButton
/// The button is toggled when clicked and its value goes from a yellow ⭐️ (filled star) to an empty grey ⭐️ (star)
struct FavoriteButton: View {
    
    // MARK: Variables
    @Binding var isSet: Bool /// isSet: Bool - binding indicates the favorite button's current state, and provide a constant value for the preview
    
    // MARK: FavoriteButton's view
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

// MARK: Preview
struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(false))
    }
}
