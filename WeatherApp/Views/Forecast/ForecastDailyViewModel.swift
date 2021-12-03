//
//  ForecastDailyViewModel.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-12-03.
//

import Foundation
import SwiftUI


struct ForecastDailyViewModel: Identifiable {
    private let item: ForecastResponse.Daily 
    
    var id: String {
      return day + temperature + iconName
    }
    
    var day: String {
        return dayOfWeekFormatter.string(from: item.dt)
    }
  
    var temperature: String {
        return String(format: "%.1f", item.temp.day)
    }
    var iconName: String {
        guard let weather = item.weather.first else { return DEFAULT_ICON_IF_ERROR }
        return weatherIcon[weather.icon, default: DEFAULT_ICON_IF_ERROR]
    }
  
    init(item: ForecastResponse.Daily) {
        self.item = item
    }
    
}
