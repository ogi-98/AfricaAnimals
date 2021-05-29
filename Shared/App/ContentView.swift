//
//  ContentView.swift
//  Shared
//
//  Created by Oğuz Kaya on 23.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    let animals:[Animal] = Bundle.main.decode("animals.json")
    
    @State private var isGridViewActive : Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .light)
//    let gridLayout:[GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible())]
    @State private var gridColumn : Int = 1
    @State private var toolbarIcon : String = "square.grid.2x2"
    
    
    //MARK: Functions
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1 )
        gridColumn = gridLayout.count
        print("grid number: \(gridColumn)")
//        TOOLBAR Image
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
            break
        case 2:
            toolbarIcon = "square.grid.3x2"
            break
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
            break
        default:
            toolbarIcon = "square.grid.2x2"
            break
        }
        
    }
    
    
    var body: some View {
        NavigationView {
            Group {
                
                if !isGridViewActive {
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
                        }//:LOOP
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { item in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: item),
                                    label: {
                                        AnimalGridItemView(animal: item)
                                    })//:LINK
                            }//:LOOP
                        }//: GRID
                        .padding(10)
                        .animation(.easeIn)
                    }//:SCROLLVIEW
                }//: Condition
                
            }//:GROUP
            .navigationBarTitle("Africa")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    HStack(spacing:16){
                        //LIST
                        Button(action: {
                            print("list view activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary: .accentColor)
                        })
                        //GRID
                        Button(action: {
                            print("gridLayout activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        })
                        
                        
                    }
                }
            })//: TOOLBAR
            
        }//:Navigation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
