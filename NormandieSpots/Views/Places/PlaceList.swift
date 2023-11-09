//
//  PlaceList.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 13/10/2023.
//

import SwiftUI

struct PlaceList: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavOnly = false
    
    var filteredPlaces: [Place] {
        modelData.places.filter { place in
            (!showFavOnly || place.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavOnly, label: {
                    Text("Favoris")
                })
                
                ForEach(filteredPlaces) { place in
                    NavigationLink {
                        PlaceDetail()
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
