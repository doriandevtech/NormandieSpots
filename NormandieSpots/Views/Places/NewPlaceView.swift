//
//  NewPlaceView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 04/04/2024.
//

// MARK: Imports
import SwiftUI
import CoreLocation

// MARK: NewPlaceView
struct NewPlaceView: View {
    
    // MARk: Variables
    @State private var newPlace = Place.emptyPlace
    
    @Binding var places: [Place]
    
    @Binding var isPresentingNewPlaceSheet: Bool
    
    @State private var isAddButtonEnabled = true
    
    @State private var selectedCategory: Place.Category = .ville
    
    // MARK: NewPlaceView's view
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

// Mark: Preview
#Preview {
    NewPlaceView(places: .constant(Place.sampleData), isPresentingNewPlaceSheet: .constant(true))
}
