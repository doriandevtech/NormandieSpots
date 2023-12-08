//
//  CategoryItem.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 08/12/2023.
//

import SwiftUI

struct CategoryItem: View {
    var place: Place
    
    var body: some View {
        VStack {
            place.image
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 2)
            Text(place.name)
                .foregroundStyle(.primary)
                .font(.title3)
        }
    }
}

#Preview {
    CategoryItem(place: ModelData().places[0])
}