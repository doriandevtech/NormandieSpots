//
//  PlaceDetail.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 09/11/2023.
//

import SwiftUI

/// Main aspect :  PlaceDetail shows the details of a selected place (Location, Image, Description, Country...)
/// sub aspects : A place can also be made "favorite" or taken out from this list in this view
struct PlaceDetail: View {
    
    
    /// Add modelData Data Model in PlaceDetail
    @EnvironmentObject var modelData: ModelData
    var place: Place
    
    
    /// Compares the input place's id with the one in the model data
    var placeIndex: Int {
        modelData.places.firstIndex(where: { $0.id == place.id })!
    }
    
    var body: some View {
        ScrollView {
///            Configure the map view of the selected place
            MapView(coordinate: place.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
///            Shows the selected place's image
            CircleImage(image: place.image)
                .offset(y: -100)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
///                This HStack shows the place's name and isFavorite ⭐️ (star) button
                HStack {
                    Text(place.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.places[placeIndex].isFavorite)
                }
                
///                This HStack shows the place's category and country
                HStack {
                    Text(place.category)
                    Spacer()
                    Text(place.country)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
///                Adds a light separation line between the infos and description section
                Divider()
                
///                Shows the place's name and description
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
