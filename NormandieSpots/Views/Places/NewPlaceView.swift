//
//  NewPlaceView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 04/04/2024.
//

// MARK: - Imports
import SwiftUI

// MARK: - NewPlaceView
struct NewPlaceView: View {
    
    // MARK: - Variables
    /// State variable for the "empty place" variable
    @State private var newPlace = Place.emptyPlace
    
    /// Declares modelData as an EnvironmentObject
    @EnvironmentObject var modelData: ModelData
    
    /// Binding to the list of `places`
    @Binding var places: [Place]
    
    /// Binding to the showing of `NewPlaceView()` view
    @Binding var isPresentingNewPlaceSheet: Bool
    
    /// State variable for the enabling of the "Add" button in `NewPlaceView()` view
    @State private var isAddButtonEnabled = true
    
    /// State variable for the selected category inside the `Picker()` view
    @State private var selectedCategory: Place.Category = .ville
    
    // MARK: - View
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
                    Picker(selection: $selectedCategory, label: Text("Catégorie")) { /// Picker view to select the place's category
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
                        modelData.places.append(newPlace)
                        isPresentingNewPlaceSheet = false
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    NewPlaceView(
        places: .constant(Place.sampleData),
        isPresentingNewPlaceSheet: .constant(true)
    )
}
