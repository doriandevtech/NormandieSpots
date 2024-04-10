//
//  NewPlaceView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 04/04/2024.
//

import SwiftUI

struct NewPlaceView: View {
    @State private var newPlace = Place.emptyPlace
    @Binding var places: [Place]
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
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        isPresentingNewPlaceSheet = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        places.append(newPlace)
                        isPresentingNewPlaceSheet = false
                    }
                }
            }
        }
    }
}

#Preview {
    NewPlaceView(places: .constant(Place.sampleData), isPresentingNewPlaceSheet: .constant(true))
}
