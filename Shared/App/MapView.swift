//
//  MapView.swift
//  Africa
//
//  Created by Oğuz Kaya on 23.05.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    
    var body: some View {
//        MARK: - NO.1 BASIC MAP
//        Map(coordinateRegion: $region)
//        MARK: - NO.2 ADVENCED MAP
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
//            (A) old style (always static)
            
//            MapPin(coordinate: item.location, tint: .accentColor)
            
//            (B) marker: new style (always static)
            
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
//            (C) Custom basic annotation (it could be interactive)
            
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            }//: ANNOTATİON
            
        })//: MAP
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
