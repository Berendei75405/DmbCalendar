//
//  Modifiers.swift
//  DmbCalendar
//
//  Created by Novgorodcev on 31.08.2024.
//

import SwiftUI

//MARK: - Neumorphism
struct NeumorphismUnSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("lightShadow"), radius: 4, x: -5, y: -5)
            .shadow(color: Color("darkShadow"), radius: 4, x: 5, y: 5)
    }
}

struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("lightShadow"), radius: 4, x: 5, y: 5)
            .shadow(color: Color("darkShadow"), radius: 4, x: -5, y: -5)
    }
}

struct NeumorphismSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Circle().fill(Color("background")))
            .neumorphismUnSelectedStyle()
    }
}
