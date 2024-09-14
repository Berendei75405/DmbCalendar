//
//  AddMilitaryViewModel.swift
//  DmbCalendar
//
//  Created by Novgorodcev on 03.09.2024.
//

import Foundation

final class AddMilitaryViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var dateStart = Date()
    @Published var dateFinish = Calendar.current.date(byAdding: DateComponents(year: 1), to: Date()) ?? Date()
}
