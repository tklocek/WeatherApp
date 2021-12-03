//
//  ChooseCityModelView.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-11-28.
//

import Foundation
import SwiftUI


class ChooseCityViewModel: ObservableObject {
    @Published var currentWeatherViewModel: CurrentWeatherViewModel
  
    init(currentWeatherViewModel: CurrentWeatherViewModel) {
        self.currentWeatherViewModel = currentWeatherViewModel
    }
    
}
