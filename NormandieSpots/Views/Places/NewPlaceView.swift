//
//  NewPlaceView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 04/04/2024.
//

import SwiftUI

struct NewPlaceView: View {
    @State private var name: String
    @State private var category: String
    
    var body: some View {
        VStack {
            Form {
                TextField(text: $name, prompt: Text("Required")) {
                    Text("Name")
                }
                TextField(text: $category, prompt: Text("Required")) {
                    Text("Category")
                }
            }
        }
    }
}

#Preview {
    NewPlaceView(name: "Hello", category: "Ville")
}
