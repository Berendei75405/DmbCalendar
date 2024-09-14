//
//  ContentView.swift
//  DmbCalendar
//
//  Created by Novgorodcev on 31.08.2024.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var calendarViewModel = CalendarViewModel()
    
    var body: some View {
        NavigationStack {
            if calendarViewModel.militaryArray.isEmpty {
                AddMilitaryView()
                    .navigationTitle("Добавление солдата")
                    .navigationBarTitleDisplayMode(.inline)
            } else {
                backgroundStackView {
                    Rectangle()
                        .navigationTitle("User name")
                        .navigationBarTitleDisplayMode(.inline)
                    //toolbar
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .foregroundStyle(Color("other"))
                                    .frame(width: 30, height: 30)
                                    .background(
                                        Rectangle()
                                            .fill(Color("background"))
                                            .frame(width: 40, height: 40)
                                            .clipShape(.buttonBorder)
                                            .neumorphismUnSelectedStyle()
                                    )
                            }
                        }
                }
            }
        }
    }
    
    //MARK: - backgroundStackView
    private func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color("background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            ScrollView {
                content()
            }
            .padding(16)
        }
    }
}

#Preview {
    CalendarView()
}
