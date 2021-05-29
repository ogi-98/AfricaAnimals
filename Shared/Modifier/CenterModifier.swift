//
//  CenterModifier.swift
//  Africa
//
//  Created by Oğuz Kaya on 29.05.2021.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
