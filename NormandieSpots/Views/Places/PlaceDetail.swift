//
//  PlaceDetail.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 09/11/2023.
//

// MARK: Imports
import SwiftUI /// Imports SwiftUI framework

// MARK: PlaceDetail
/// Main aspect :  PlaceDetail shows the details of a selected place (Location, Image, Description, Country...)
/// sub aspects : A place can also be made "favorite" or taken out from this list in this view
struct PlaceDetail: View {
    
    // MARK: Variables
    /// modelData: ModelData - Declares modelData as an EnvironmentObject
    @EnvironmentObject var modelData: ModelData

    /// place: Place - place's declaration
    var place: Place
    
    /// placeIndex: Int - compares the input place's id with the one in the model data
    var placeIndex: Int {
        modelData.places.firstIndex(where: { $0.id == place.id })!
    }
    
    // MARK: PlaceDetail's view
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
                
///                Shows the place's category
                Text(place.category.rawValue)
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

// MARK: Preview
struct PlaceDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        PlaceDetail(place: modelData.places[0])
            .environmentObject(modelData)
    }
}
