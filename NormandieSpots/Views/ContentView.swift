//
//  ContentView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlaceList()
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
