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
    
    @Binding var setting: [Setting] /// setting: [Setting] - declares setting as a list of settings
    
    /// Enum "Tab" contains the list of tabs
    enum Tab {
        case home
        case list
        case setting
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

// MARK: Preview
struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView(setting: .constant(Setting.sampleData))
            .environmentObject(ModelData())
    }
}
