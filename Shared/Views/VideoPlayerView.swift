//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Oğuz Kaya on 25.05.2021.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    var videoSelected: String
    var videotitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4") ) {
//                Text(videotitle)
            }
            .overlay(
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(.top, 6)
                .padding(.leading,8)
                ,alignment: .topLeading
            )
            
        }//:VSTACK
        .accentColor(.accentColor)
        .navigationBarTitle(videotitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videotitle: "Lion ")
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
