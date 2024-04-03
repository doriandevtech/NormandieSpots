//
//  CategoryHome.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 08/12/2023.
//

// MARK: Imports
import SwiftUI /// Imports SwiftUI framework

// MARK: CategoryHome
/// Main aspect: displays a NavigationSplitView of a featured place's image and a row for each category
struct CategoryHome: View {
    
    // MARK: Variables
    /// modelData: ModelData - Declares modelData as an EnvironmentObject
    @EnvironmentObject var modelData: ModelData
    
    
    // MARK: CategoryHome's view
    /// The "body" contains a NavigationSplitView of a featured place's image and a row for each category
    var body: some View {
        NavigationSplitView {
            List {
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

// MARK: Preview
/// Shows a preview of CategoryHome
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
