//
//  MapView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 09/11/2023.
//

// MARK: - Imports
import SwiftUI
import MapKit

// MARK: - MapView
/// Configures the map displayed for the PlaceDetail view
struct MapView: View {
    
    // MARK: - Variables
    /// Contains the latitude and longitude to a given position
    var coordinate: CLLocationCoordinate2D
    
    /// Sets a `State` variable as a rectangular geographic region that centers around a specific latitude and longitude
    @State private var region = MKCoordinateRegion()
    
    // MARK: - View
    /// MapView's view - contains a list of subviews for the settings of the app
    var body: some View {
        /// Displays a map for a given region
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    // MARK: - Functions
    /// Sets the variable region according to the latitude and longitude values linked to the selected place
    /// - Parameter coordinate: The latitude and longitude associated with the selected place
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

// MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 48.84149, longitude: 2.26639))
    }
}
