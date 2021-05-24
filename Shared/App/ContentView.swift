//
//  ContentView.swift
//  Shared
//
//  Created by Oğuz Kaya on 23.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    let animals:[Animal] = Bundle.main.decode("animals.json")
    
    
    var body: some View {
        NavigationView {
            List {
                
                CoverImageView()
                    .frame(height:300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                ForEach(animals) { item in
                    NavigationLink(
                        destination: AnimalDetailView(animal: item),
                        label: {
                            AnimalListItemView(animal: item)
                        })//:Link
                    
                }
                
            }//: List
            .navigationBarTitle("Africa")
            
        }//:Navigation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
