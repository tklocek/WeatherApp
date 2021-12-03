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
  
    var lat: String {
        return String(item.coord.lat)
    }
    var lon: String {
        return String(item.coord.lon)
    }

    init(item: CurrentWeatherResponse) {
        self.item = item
    }
    
}
