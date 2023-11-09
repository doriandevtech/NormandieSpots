//
//  PlaceDetail.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 09/11/2023.
//

import SwiftUI

struct PlaceDetail: View {
    @EnvironmentObject var modelData: ModelData
    var place: Place
    
    var placeIndex: Int {
        modelData.places.firstIndex(where: { $0.id == place.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: place.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: place.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(place.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.places[placeIndex].isFavorite)
                }
                
                HStack {
                    Text(place.category)
                    Spacer()
                    Text(place.country)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(place.name)")
                    .font(.title2)
                Text(place.description)
            }
            .padding()
        }
        .navigationTitle(place.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        PlaceDetail(place: modelData.places[0])
            .environmentObject(modelData)
    }
}
