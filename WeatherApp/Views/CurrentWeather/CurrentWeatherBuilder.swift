//
//  CurrentWeatherBuilder.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-12-03.
//

import SwiftUI

enum CurrentWeatherBuilder {
//  static func makeForecastView(withCity city: String, weatherFetcher: WeatherFetchable ) -> some View {
//    let viewModel = ForecastViewModel(city: city, weatherFetcher: weatherFetcher)
//    return ForecastView(viewModel: viewModel)
//  }
    static func makeChooseCityView( currentViewModel: CurrentWeatherViewModel ) -> some View {
        let viewModel = ChooseCityViewModel(currentWeatherViewModel: currentViewModel)
      return ChooseCityView(viewModel: viewModel)
    }
    
    
}
