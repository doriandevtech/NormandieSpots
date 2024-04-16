//
//  PlaceDetail.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 09/11/2023.
//

// MARK: Imports
import SwiftUI /// Imports SwiftUI framework

// MARK: PlaceDetail
/// Main aspect : PlaceDetail shows the details of a selected place (Location, Image, Description, Country...)
/// sub aspects : A place can also be made "favorite" or taken out from this list in this view
struct PlaceDetail: View {
    
    // MARK: Variables
    /// modelData: ModelData - Declares modelData as an EnvironmentObject
    @EnvironmentObject var modelData: ModelData

    /// place: Place - "place"'s declaration
    var place: Place
    
    /// placeIndex: Int - compares the input "place"'s id with the one in the model data
    var placeIndex: Int {
        modelData.places.firstIndex(where: { $0.id == place.id })!
    }
    
    // MARK: PlaceDetail's view
    var body: some View {
        ScrollView {
            MapView(coordinate: place.locationCoordinate) /// Configures the map view of the selected "place"
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: place.image) /// "Place"'s image disposal
                .offset(y: -100)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack { 						/// "Place"'s name and isFavorite ⭐️ (star) button
                    Text(place.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.places[placeIndex].isFavorite)
                }
                
                Text(place.category.rawValue) 	/// "Place"'s category
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Divider() 						/// Separation line between the infos and description section
                
                Text("À propos de \(place.name)") 	/// "Place"'s name and description
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
