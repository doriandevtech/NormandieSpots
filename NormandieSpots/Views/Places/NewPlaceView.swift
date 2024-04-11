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
    
    @State private var isAddButtonEnabled = true
    
    var body: some View {
        NavigationView {
            Form {
                Section("Quel est le nom de ce nouveau lieu ?") {
                    TextField("Nom du lieu", text: $newPlace.name)
                }
                Section("Où se situe ce lieu ?") {
                    TextField("Nom du pays", text: $newPlace.country)
                }
                Section("Ajouter ce lieu aux favoris ?") {
                    Toggle(isOn: $newPlace.isFavorite) {
                        Label("Ajouter aux favoris", systemImage: "star.fill")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Annuler") {
                        isPresentingNewPlaceSheet = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Ajouter") {
                        places.append(newPlace)
                        isPresentingNewPlaceSheet = false
                    }
                    .disabled(isAddButtonEnabled)
                }
            }
        }
    }
}

#Preview {
    NewPlaceView(places: .constant(Place.sampleData), isPresentingNewPlaceSheet: .constant(true))
}
