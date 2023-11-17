//
//  MapView.swift
//  NormandieSpots
//
//  Created by Dorian Emenir on 09/11/2023.
//

import SwiftUI
import MapKit

/// Configures the map displayed for the PlaceDetail view
struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    /// Sets the variable recgion as rectangular geographic region that centers around a specific latitude and longitude
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
///        Displays a map for a given region
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    /// Sets the variable region according to the latitude and longitude values linked to the selected place
    /// - Parameter coordinate: The latitude and longitude associated with the selected place
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 48.84149, longitude: 2.26639))
    }
}
