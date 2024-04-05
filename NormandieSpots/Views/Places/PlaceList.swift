//
//  PlaceList.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 13/10/2023.
//

// MARK: Imports
import SwiftUI /// Import SwiftUI framework

// MARK: PlacesList
/// Main aspect :  PlaceList configures a list of places
/// sub aspects : PlaceList can filter places using there "isFavorite" attribute
struct PlaceList: View {
    
    // MARK: Variables
    /// @EnvironmentObject modelData an instance of the data model ModelData in PlaceList: ModelData
    @EnvironmentObject var modelData: ModelData

    /// @State variable for the "Show favorite" toggle: Bool
    @State private var showFavOnly = false
    
    /// @State variable for the "Delete alert popup": Bool
    @State private var showDeleteAlert = false
    
    /// @State variable isPresentingNewSpotView: Bool
    @State private var isPresentingNewSpotView = false
    
    /// filteredPlaces shows only favorite places when "Show favorite" toggle is on
    var filteredPlaces: [Place] {
        modelData.places.filter { place in
            (!showFavOnly || place.isFavorite)
        }
    }
    
    // MARK: PlaceList's view    
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
                
///                Swipe action for each row - "Delete" and "Add to favorite list":
                .swipeActions(edge: .trailing) {
                    Button {
                        withAnimation { showDeleteAlert.toggle() }
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                    .tint(.red)
                }
                .swipeActions(edge: .leading) {
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
            .alert(isPresented: $showDeleteAlert) {
                Alert(
                    title: Text("Confirmez-vous la suppression de ce lieu ?"),
                    primaryButton: .cancel(Text("Annuler")),
                    secondaryButton: .destructive(Text("Supprimer")) {
                        print("item deleted")
                    }
                )
            }
            .toolbar {
                Button(action: {
                    isPresentingNewSpotView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Ajout d'un nouveau lieu")
            }
            .sheet(isPresented: $isPresentingNewSpotView, content: {
                NewPlaceView(name: <#T##Binding<String>#>, category: <#T##Binding<String>#>)
            })
        }
    }
}

// MARK: Preview
struct PlaceList_Previews: PreviewProvider {
    static var previews: some View {
        PlaceList()
            .environmentObject(ModelData())
    }
}
