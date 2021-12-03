//
//  ChooseCityView.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-11-28.
//

import SwiftUI

struct ChooseCityView: View {
    @ObservedObject var viewModel: ChooseCityViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(viewModel: ChooseCityViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Form {
            Section(header: Text("CITY")) {
                TextField(
                    "City name",
                    text: $viewModel.currentWeatherViewModel.city)
            }
            
            Section {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }
            }
        }
        .textFieldStyle(.roundedBorder)
    }
}
