//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-11-25.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            let fetcher = WeatherFetcher()
            let viewModel = CurrentWeatherViewModel(city: "Wrocław", weatherFecher: fetcher)
            CurrentWeatherView(viewModel: viewModel)            
        }
    }
}
