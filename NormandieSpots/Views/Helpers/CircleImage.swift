//
//  CircleImage.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 09/11/2023.
//

// MARK: - Imports
import SwiftUI

// MARK: - CircleImage
/// Configures an item's image as a circle image
struct CircleImage: View {
    
    // MARK: - Variables
    var image: Image
    
    // MARK: - View
    /// Body contains the image passed in parameter modified by some modifiers
    var body: some View {
        image
            .resizable()
            .frame(width: 275, height: 275)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 5)
            }
            .shadow(radius: 5)
    }
}

// MARK: - Preview
#Preview {
    CircleImage(image: Image("etretat"))
}
