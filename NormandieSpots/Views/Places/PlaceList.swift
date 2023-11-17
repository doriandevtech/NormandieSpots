//
//  PlaceList.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 13/10/2023.
//

import SwiftUI

/// Main aspect :  PlaceList configures a list of places
/// sub aspects : PlaceList can filter places using there "isFavorite" attribute
struct PlaceList: View {
    
    /// Add modelData Data Model in PlaceList
    @EnvironmentObject var modelData: ModelData
    
    
    /// Create a private variable for the "Show favorite" toggle
    @State private var showFavOnly = false
    
    
    /// filteredPlaces shows only favorite places when "Show favorite" toggle is on
    var filteredPlaces: [Place] {
        modelData.places.filter { place in
            (!showFavOnly || place.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
///                Adds a isFavorite toggle item
                Toggle(isOn: $showFavOnly, label: {
                    Text("Favoris")
                })
                
///                Each place has a link from PlaceRow redirecting to its PlaceDetail view
                ForEach(filteredPlaces) { place in
                    NavigationLink {
                        PlaceDetail(place: place)
                    } label: {
                        PlaceRow(place: place)
                    }
                }
            }
            .navigationTitle("Lieux")
        }
    }
}

struct PlaceList_Previews: PreviewProvider {
    static var previews: some View {
        PlaceList()
            .environmentObject(ModelData())
    }
}
