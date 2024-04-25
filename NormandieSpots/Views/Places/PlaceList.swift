//
//  PlaceList.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 13/10/2023.
//

// MARK: Imports
import SwiftUI

// MARK: PlacesList
/// Main aspect :  PlaceList configures a list of places
/// sub aspects : PlaceList can filter places using there "isFavorite" attribute
struct PlaceList: View {
    
    // MARK: Variables
    /// modelData: ModelData - Declares modelData as an EnvironmentObject
    @EnvironmentObject var modelData: ModelData

    /// showFavOnly: Bool - State variable for the "Show favorite" toggle
    @State private var showFavOnly = false
    
    /// showDeleteAlert: Bool - State variable for the "Delete alert" popup
    @State private var showDeleteAlert = false
    
    /// isPresentingNewSpotView: Bool - State variable for the showing of NewPlaceView( ) view
    @State private var isPresentingNewSpotView = false
    
    /// places: [Places] - Binding to the list of places
    @Binding var places: [Place]
    
    /// filteredPlaces: [Place] - filters the favorite places from the list of places
    /// shows only favorite places when "Show favorite" toggle is on
    var filteredPlaces: [Place] {
        modelData.places.filter { place in
            (!showFavOnly || place.isFavorite)
        }
    }
    
    // MARK: PlaceList's view    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavOnly, label: { /// Adds a isFavorite toggle item
                    Text("Favoris")
                })
                
                ForEach(filteredPlaces) { place in  /// Each place has a link from PlaceRow( ) redirecting to its PlaceDetail( ) view
                    NavigationLink {
                        PlaceDetail(place: place)
                    } label: {
                        PlaceRow(place: place)
                    }
                }
                .swipeActions(edge: .trailing) {    /// Swipe action for each row - "Delete" from list" - TODO: In Progress...
                    Button {
                        withAnimation { showDeleteAlert.toggle() }
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                    .tint(.red)
                }
                .swipeActions(edge: .leading) {     /// Swipe action for each row - "Add" to favorite list"
                    Button {
                        if ((filteredPlaces.firstIndex(where: { $0.id == 1002})) != nil) {
                            print("hello")
                        }
                    } label: {
                        Label("Favorite", systemImage: "star.fill")
                    }
                    .tint(.yellow)
                }
            }
            .navigationTitle("Lieux")
            .alert(isPresented: $showDeleteAlert) { /// Shows this alert when the "Delete" swipeAction is performed
                Alert(
                    title: Text("Confirmez-vous la suppression de ce lieu ?"),
                    primaryButton: .cancel(Text("Annuler")),
                    secondaryButton: .destructive(Text("Supprimer")) {
                        print("item deleted")
                    }
                )
            }
            .toolbar {                              /// "+" button toggling the NewPlaceView( ) when pressed
                Button(action: {
                    isPresentingNewSpotView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Ajout d'un nouveau lieu")
            }
            .sheet(isPresented: $isPresentingNewSpotView) {
                NewPlaceView(places: $places, isPresentingNewPlaceSheet: $isPresentingNewSpotView)
            }
        }
    }
}

// MARK: Preview
struct PlaceList_Previews: PreviewProvider {
    static var previews: some View {
        PlaceList(places: .constant(Place.sampleData))
            .environmentObject(ModelData())
    }
}
