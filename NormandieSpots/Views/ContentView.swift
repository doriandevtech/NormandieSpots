//
//  ContentView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

// MARK: Imports
import SwiftUI /// Imports SwiftUI framework

// MARK: ContentView
struct ContentView: View {
    
    // MARK: Variables
    @State private var selection: Tab = .home /// selection: Tab - "Home" view as the default view at app lauch
    
    @Binding var place: Place
        
    /// Enum "Tab" contains the list of tabs
    enum Tab {
        case home
        case list
    }
    
    // MARK: ContentView's view
    /// Defines the content of "body" with a TabView and an item per tab
    var body: some View {
        TabView(selection: $selection) {
            /// CategoryHome view - "home" tabItem
            CategoryHome()
                .tabItem { /// CategoryHome - tabItem's content
                    Label("Accueil", systemImage: "house.fill")
                }
                .tag(Tab.home) /// CategoryHome - tab "home" link
            
            /// PlaceList view - "list" tabItem
            PlaceList(place: $place)
                .tabItem { /// PlaceList - tabItem's content
                    Label("Lieux", systemImage: "list.bullet")
                }
                .tag(Tab.list) /// PlaceList - tab "list" link
        }
    }
}

// MARK: Preview
struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView(place: .constant(Place.sampleData[0]))
            .environmentObject(ModelData())
    }
}
