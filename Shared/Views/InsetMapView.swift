//
//  InsetMapView.swift
//  Africa
//
//  Created by Oğuz Kaya on 24.05.2021.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
            NavigationLink(
                destination: MapView(),
                label: {
                    /*@START_MENU_TOKEN@*/HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("Loacitons")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }/*@END_MENU_TOKEN@*/ //:Hstack
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8.0)
                    )
                    
                })//:Navigation
                .padding(12)
                , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
