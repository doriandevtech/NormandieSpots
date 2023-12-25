//
//  ContentView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    /// Defines "Home" view as the default view at app lauch
    @State private var selection: Tab = .home
    
    /// Enum "Tab" contains the list of tabs
    enum Tab {
        case home
        case list
    }
    
    /// Defines the content of "body" with a TabView and an item per tab
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Accueil", systemImage: "house.fill")
                }
                .tag(Tab.home)
            
            PlaceList()
                .tabItem {
                    Label("Lieux", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

/// Previews the ContentView
struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
