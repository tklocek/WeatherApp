//
//  CurrentWeatherModelView.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-11-27.
//

import SwiftUI
import Combine

class CurrentWeatherViewModel: ObservableObject, Identifiable {
    @Published var dataSource: MainWeatherViewModel?
    var city: String
    
    private let weatherFecher: WeatherFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(city: String, weatherFecher: WeatherFetchable) {
        self.city = city
        self.weatherFecher = weatherFecher
    }
    
    func refresh() {
        weatherFecher
            .currentWeather(forCiry: city)
            .map(MainWeatherViewModel.init)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {  [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = nil
                case .finished:
                    break
                }
            }
                  , receiveValue: { [weak self] weather in
                guard let self = self else { return }
                self.dataSource = weather
            })
            .store(in: &disposables)
    }
}


extension CurrentWeatherViewModel {
  var chooseCityView: some View {
      return CurrentWeatherBuilder.makeChooseCityView (currentViewModel: self)
  }
}
