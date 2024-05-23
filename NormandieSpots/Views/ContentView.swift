//
//  ContentView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

// MARK: Imports
import SwiftUI

// MARK: ContentView
struct ContentView: View {
    
    // MARK: Variables
    /// `selection`: Tab - "Home" view as the default view at app launch
    @State private var selection: Tab = .home
    
    /// `places`: [Places] - Binding to the list of places
    @Binding var places: [Place]
    
    @Environment(\.scenePhase) private var scenePhase
    
    let saveAction: ()->Void
    
    /// Enum `Tab` contains the list of tabs
    enum Tab {
        case home
        case list
    }
    
    // MARK: ContentView's view
    /// Defines the content of "body" with a `TabView` and an item per tab
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()                  /// CategoryHome view - "home" tabItem
                .tabItem {              /// CategoryHome - tabItem's content
                    Label("Accueil", systemImage: "house.fill")
                }
                .tag(Tab.home)          /// CategoryHome - tab "home" link
            
            PlaceList(places: $places)      /// PlaceList view - "list" tabItem
            .tabItem {                  /// PlaceList - tabItem's content
                Label("Lieux", systemImage: "list.bullet")
            }
            .tag(Tab.list)              /// PlaceList - tab "list" link
            .onChange(of: scenePhase) { phase in /// Triggers `saveAction()` if `phase` in `inactive`
                if phase == .inactive { saveAction() }
            }
        }
    }
}

// MARK: Preview
struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView(places: .constant(Place.sampleData), saveAction: {})
            .environmentObject(ModelData())
    }
}
