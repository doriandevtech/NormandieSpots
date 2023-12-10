//
//  CategoryRow.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 08/12/2023.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var placesList: [Place]
    var places = ModelData().places
    
    var body: some View {
        VStack {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {                    ForEach(placesList) { place in
                        NavigationLink {
                            PlaceDetail(place: place)
                        } label: {
                            CategoryItem(place: place)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Preview: PreviewProvider {
    static var places = ModelData().places
    
    static var previews: some View {
        CategoryRow(
            categoryName: places[0].category.rawValue,
            placesList: Array(ModelData().places.prefix(3)))
    }
}
