//
//  HeadingView.swift
//  Africa
//
//  Created by Oğuz Kaya on 23.05.2021.
//

import SwiftUI

struct HeadingView: View {
    
    var headingImage:String
    var headingtext: String
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            
            Text(headingtext)
                .font(.title3)
                .fontWeight(.bold)
            
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingtext: "Wilderness and pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
