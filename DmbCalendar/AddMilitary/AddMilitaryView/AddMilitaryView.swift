//
//  AddMilitaryView.swift
//  DmbCalendar
//
//  Created by Novgorodcev on 01.09.2024.
//

import SwiftUI

struct AddMilitaryView: View {
    
    //environment
    @Environment(\.mainWindowSize) var size
    
    //state obj
    @StateObject private var viewModel = AddMilitaryViewModel()
    
    //states
    @State private var name = ""
    @State private var readyAnimate = false
    @State private var addOpacity = 0.0
    
    //variables
    private var gradient: LinearGradient {
        LinearGradient(colors: [Color("top"), Color("bottom")], startPoint: .bottom, endPoint: .top)
    }
    
    var body: some View {
        NavigationStack {
            List {
                nameCell
                dateStart
                dateFinish
            }
            .scrollContentBackground(.hidden)
            .neumorphismUnSelectedStyle()
            .listRowBackground(Color("background"))
            //toolbar
            .navigationTitle("Добавление солдата")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        
                    } label: {
                        Text("Готово")
                            .foregroundStyle(Color("other"))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("background"))
                                    .frame(width: 70, height: 40)
                                    .neumorphismUnSelectedStyle()
                            )
                            .offset(x: readyAnimate ? 0 : 150)
                    }
                }
            }
            //Исчезающий баннер
            addMilitary
            Spacer()
                .frame(height: 32)
        }
        //при загрузке экрана
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                withAnimation(.easeInOut(duration: 0.8)) {
                    addOpacity = 1
                }
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                withAnimation(.easeInOut(duration: 0.8)) {
                    addOpacity = 0
                }
            })
        }
    }
    
    //MARK: - nameCell
    private var nameCell: some View {
        HStack {
            Text("Имя")
                .foregroundStyle(Color("other"))
            Spacer()
            TextField("Иван", text: Binding(get: {
                name
            }, set: { newValue in
                name = newValue
                viewModel.name = name
                //Анимация кнопки готово
                withAnimation(.bouncy(duration: 0.7)) {
                    if !newValue.isEmpty {
                        readyAnimate = true
                    } else {
                        readyAnimate = false
                    }
                }
            }))
            .multilineTextAlignment(.trailing)
            .foregroundStyle(Color("other"))
        }
        .frame(height: 37)
    }
    
    //MARK: - dateStart
    private var dateStart: some View {
        HStack {
            Text("Дата призыва")
                .foregroundStyle(Color("other"))
            Spacer()
            DatePicker("", selection: $viewModel.dateStart, displayedComponents: .date)
                .pickerStyle(.segmented)
                .labelsHidden()
                .environment(\.locale, Locale.init(identifier: "ru"))
                .onChange(of: viewModel.dateStart) {
                    viewModel.dateFinish = Calendar.current.date(byAdding: DateComponents(year: 1), to: viewModel.dateStart) ?? viewModel.dateStart
                }
        }
        .frame(height: 37)
    }
    
    //MARK: - dateFinish
    private var dateFinish: some View {
        HStack {
            Text("Дата дембеля")
            Spacer()
            DatePicker("", selection: $viewModel.dateFinish, displayedComponents: .date)
                .pickerStyle(.segmented)
                .labelsHidden()
                .environment(\.locale, Locale.init(identifier: "ru"))
        }
        .frame(height: 37)
    }
    
    //MARK: - addMilitary
    private var addMilitary: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("background"))
                .frame(width: 250, height: 60)
                .overlay {
                    RoundedRectangle(cornerRadius: 15.0)
                        .stroke(gradient, lineWidth: 1)
                }
            Text("Добавьте военнослужащего")
        }
        .opacity(addOpacity)
    }
}

#Preview {
    GeometryReader { proxy in
        AddMilitaryView()
            .environment(\.mainWindowSize, proxy.size)
    }
}
