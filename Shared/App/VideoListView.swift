//
//  VideoListView.swift
//  Africa
//
//  Created by Oğuz Kaya on 23.05.2021.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videoss: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videoss) { item in
                    NavigationLink(
                        destination: VideoPlayerView(videoSelected: item.id, videotitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical)
                    }
                }//:LOOP
                
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button(action: {
//                        shuffle videos
                        videoss.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "shuffle")
                            
                    })
                }
            })
            
        }//:NAVIGATION
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
