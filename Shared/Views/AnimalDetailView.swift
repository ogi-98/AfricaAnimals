//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Oğuz Kaya on 23.05.2021.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal: Animal
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center,spacing:20) {
                
//                HEROIMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
//                TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y:24)
                    )
                
//                HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                
//                GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingtext: "Wilderness in Pictures")
                    InsetsGaleryView(animal: animal)
                }
                .padding(.horizontal)
                
//                FACTS
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingtext: "Did you known?")
                    
                    InsetFactView(animal: animal)
                    
                }
                .padding(.horizontal)
                
//                DESCRIPTION
                Group {
                    HeadingView(headingImage: "info.circle", headingtext: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
               
                
//                MAP
                Group{
                    HeadingView(headingImage: "map", headingtext: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                
                
//                LINK
                Group {
                    HeadingView(headingImage: "books.vertical", headingtext: "Learn More")
                    ExternalWebLinkView(animal: animal)
                    
                }
                .padding(.horizontal)
                
                
                
            }//: Vstack
            .navigationBarTitle("Learn About \(animal.name)", displayMode: .inline)
            
        }//:Scroll
        
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[0])
        }
        
    }
}
