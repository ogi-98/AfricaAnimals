//
//  GaleryView.swift
//  Africa
//
//  Created by Oğuz Kaya on 23.05.2021.
//

import SwiftUI

struct GaleryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
        }//:Scroll
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GaleryView_Previews: PreviewProvider {
    static var previews: some View {
        GaleryView()
    }
}
