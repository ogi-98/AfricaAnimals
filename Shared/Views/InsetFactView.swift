//
//  InsetFactView.swift
//  Africa
//
//  Created by Oğuz Kaya on 24.05.2021.
//

import SwiftUI

struct InsetFactView: View {
    let animal: Animal
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact,id: \.self) { item in
                    Text(item)
                }

            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight:148, idealHeight: 168,maxHeight: 180)
        }//:GroupBox
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
