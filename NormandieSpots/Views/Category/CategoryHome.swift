//
//  CategoryHome.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 08/12/2023.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { category in
                    CategoryRow(categoryName: category, placesList: modelData.categories[category]!)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Lieux")
        } detail: {
            Text("Choisissez un lieu")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
