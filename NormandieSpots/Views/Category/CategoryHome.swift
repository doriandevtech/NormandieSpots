//
//  CategoryHome.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 08/12/2023.
//

/// Imports SeiftUI framework
import SwiftUI

/// Main aspect: displays a NavigationSplitView of a featured place's image and a row for each category
struct CategoryHome: View {
    /// Declares modelData as an EnvironmentObject
    @EnvironmentObject var modelData: ModelData
    
    /// The "body" contains a NavigationSplitView of a featured place's image and a row for each category
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
            .listStyle(.inset) /// Adds list style
            .navigationTitle("Accueil") /// Adds title to the List
        } detail: {
            Text("Choisissez un lieu")
        }
    }
}

/// Shows a preview of CategoryHome
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
