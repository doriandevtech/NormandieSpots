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
                /// Adds a featured image on top of the categories rows
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                /// Displays places according to each category
                ForEach(modelData.categories.keys.sorted(), id: \.self) { category in
                    CategoryRow(categoryName: category, placesList: modelData.categories[category]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Home")
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
