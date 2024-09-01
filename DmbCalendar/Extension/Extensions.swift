//
//  Extensions.swift
//  DmbCalendar
//
//  Created by Novgorodcev on 31.08.2024.
//

import SwiftUI

//MARK: - Neumorphism
extension View {
    
    func neumorphismUnSelectedStyle() -> some View {
        modifier(NeumorphismUnSelected())
    }
    
    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }
    
    func neumorphismSelectedCircle() -> some View {
        modifier(NeumorphismSelectedCircle())
    }
}
