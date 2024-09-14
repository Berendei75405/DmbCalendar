//
//  CalendarModel.swift
//  DmbCalendar
//
//  Created by Novgorodcev on 31.08.2024.
//

import Foundation

//MARK: - Military
struct Military: Identifiable {
    var id: ObjectIdentifier
    var name: String
    var dateStart: Date
    var dateFinish: Date
}
