//
//  CircleImage.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 09/11/2023.
//

/// Imports SwiftUI framework
import SwiftUI

/// Configures an item's image as a circle image
struct CircleImage: View {
    /// Variable "image" declaration
    var image: Image
    
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

/// Shows a preview of CircleImage with a default parameter
struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("etretat"))
    }
}
