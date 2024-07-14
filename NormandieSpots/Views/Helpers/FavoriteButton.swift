//
//  FavoriteButton.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 09/11/2023.
//

// MARK: - Imports
import SwiftUI

// MARK: - FavoriteButton
/// The button is toggled when clicked and its value goes from a yellow ⭐️ (filled star) to an empty grey ⭐️ (star)
struct FavoriteButton: View {
    
    // MARK: - Variables
    /// Binding indicates the favorite button's current state, and provide a constant value for the preview
    @Binding var isSet: Bool
    
    // MARK: - View
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

// MARK: - Preview
#Preview {
    FavoriteButton(isSet: .constant(false))
}
