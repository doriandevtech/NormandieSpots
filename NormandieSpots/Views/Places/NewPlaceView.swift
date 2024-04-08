//
//  NewPlaceView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 04/04/2024.
//

import SwiftUI

struct NewPlaceView: View {
    @State private var newPlace = Place.emptyPlace
    @Binding var place: Place
    @Binding var isPresentingNewPlaceSheet: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section("Nouveau lieu") {
                    TextField("Nom du lieu", text: $newPlace.name)
                    TextField("Nom du pays", text: $newPlace.country)
                    Toggle(isOn: $newPlace.isFavorite) {
                        Label("Ajouter aux favoris", systemImage: "star.fill")
                    }
                }
            }
        }
    }
}

#Preview {
    NewPlaceView(place: .constant(Place.sampleData[0]), isPresentingNewPlaceSheet: .constant(true))
}
