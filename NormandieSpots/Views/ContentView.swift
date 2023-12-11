//
//  ContentView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case list
    }
    
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

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
