//
//  NewPlaceView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 04/04/2024.
//

import SwiftUI

struct NewPlaceView: View {
    
    /// newPlace: Place - State variable for the "empty place" variable
    @State private var newPlace = Place.emptyPlace
    
    /// places: [Places] - Binding to the list of places
    @Binding var places: [Place]
    
    /// isPresentingNewPlaceSheet: Bool - Binding to the showing of NewPlaceView( ) view
    @Binding var isPresentingNewPlaceSheet: Bool
    
    /// isAddButtonEnabled: Bool - State variable for the enabling of the "Add" button in NewPlaceView( ) view
    @State private var isAddButtonEnabled = true
    
    /// selectedCategory: Place.Category - State variable for the selected category inside the Picker( ) view
    @State private var selectedCategory: Place.Category = .ville
    
    var body: some View {
        NavigationView {
            Form {
                Section("Quel est le nom de ce nouveau lieu ?") {
                    TextField("Nom du lieu", text: $newPlace.name)
                }
                Section("Où se situe ce lieu ?") {
                    TextField("Nom du pays", text: $newPlace.country)
                }
                Section("Quel est le type de lieu ?") {
                    Picker(selection: $selectedCategory, label: Text("Catégorie")) {
                        Text("Ville").tag(Place.Category.ville)
                        Text("Monument").tag(Place.Category.monument)
                        Text("Commune").tag(Place.Category.commune)
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Toggle(isOn: $newPlace.isFavorite) {
                        Text("Ajouter aux favoris ?")
                    }
                }
                Section("Ajouter une photo ?") {
                    Button(action: {
                        let _ = print("hello")
                    }, label: {
                        Text("Importer une photo")
                    })
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
