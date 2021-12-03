//
//  MainWeatherViewModel.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-12-02.
//

import Foundation
import SwiftUI


struct MainWeatherViewModel {
    private let item: CurrentWeatherResponse
  
    var temperature: String {
        return String(format: "%.1f", item.main.temp)
    }
    var iconName: String {
        guard let weather = item.weather.first else { return DEFAULT_ICON_IF_ERROR }
        return weatherIcon[weather.icon, default: DEFAULT_ICON_IF_ERROR]
    }
  
    init(item: CurrentWeatherResponse) {
        self.item = item
    }
    
}
