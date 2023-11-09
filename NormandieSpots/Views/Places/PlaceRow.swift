//
//  PlaceRow.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 09/11/2023.
//

import SwiftUI

struct PlaceRow: View {
    var place: Place
    
    var body: some View {
        HStack {
            place.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(place.name)
            
            Spacer()
            
            if place.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct PlaceRow_Previews: PreviewProvider {
    static var places = ModelData().places
    
    static var previews: some View {
        Group {
            PlaceRow(place: places[0])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
