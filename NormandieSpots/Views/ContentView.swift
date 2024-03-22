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
    
    @Binding var setting: [Setting]
    
    /// Enum "Tab" contains the list of tabs
    enum Tab {
        case home
        case list
        case setting
    }
    
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
            PlaceList()
                .tabItem { /// PlaceList - tabItem's content
                    Label("Lieux", systemImage: "list.bullet")
                }
                .tag(Tab.list) /// PlaceList - tab "list" link
            
            /// SettingsView()
            SettingsView(setting: .constant(.sampleData[0]))
                .tabItem {
                    Label("Réglages", systemImage: "slider.horizontal.3")
                }
                .tag(Tab.setting)
        }
    }
}

/// Previews the ContentView view
struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView(setting: .constant(Setting.sampleData))
            .environmentObject(ModelData())
    }
}
