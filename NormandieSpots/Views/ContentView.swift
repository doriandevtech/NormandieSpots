//
//  ContentView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

// MARK: - Imports
import SwiftUI

// MARK: - ContentView
struct ContentView: View {
    
    // MARK: - Variables
    /// "Home" view as the default view at app launch
    @State private var selection: Tab = .home
    
    /// Binding to the list of places
    @Binding var places: [Place]
    
    @Environment(\.scenePhase) private var scenePhase
    
    let saveAction: ()->Void
    
    /// Contains the list of tabs
    enum Tab {
        case home
        case list
    }
    
    // MARK: - View
    /// Defines the content of "body" with a `TabView` and an item per tab
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()                  /// CategoryHome view - "home" tabItem
                .tabItem {
                    Label("Accueil", systemImage: "house.fill")
                }
                .tag(Tab.home)
            
            PlaceList(places: $places)      /// PlaceList view - "list" tabItem
                .tabItem {
                    Label("Lieux", systemImage: "list.bullet")
                }
                .tag(Tab.list)
                .onChange(of: scenePhase) { phase in /// Triggers `saveAction()` if `phase` in `inactive`
                    if phase == .inactive { saveAction() }
                }
        }
    }
}

// MARK: - Preview
struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView(places: .constant(Place.sampleData), saveAction: {})
            .environmentObject(ModelData())
    }
}
