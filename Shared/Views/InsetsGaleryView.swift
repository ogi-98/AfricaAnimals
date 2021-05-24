//
//  InsetsGaleryView.swift
//  Africa
//
//  Created by Oğuz Kaya on 23.05.2021.
//

import SwiftUI

struct InsetsGaleryView: View {
    let animal : Animal
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack (alignment: .center, spacing: 15){
                ForEach(animal.gallery,id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(15)
                }
            }//:Hstack
        }
        
        
        
    }
}

struct InsetsGaleryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetsGaleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
