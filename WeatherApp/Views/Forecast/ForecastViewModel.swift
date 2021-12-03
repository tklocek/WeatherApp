//
//  ForecastModelView.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-11-28.
//

import Foundation
import SwiftUI
import Combine


class ForecastViewModel: ObservableObject, Identifiable {
    @Published var dataSource: [ForecastDailyViewModel] = []
    var city: String
    var lat, lon: String
    
    private let weatherFecher: WeatherFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(city: String, lat: String, lon: String, weatherFecher: WeatherFetchable) {
        self.city = city
        self.lat = lat
        self.lon = lon
        self.weatherFecher = weatherFecher
    }
    
    func refresh() {
        weatherFecher
            .weatherForecast(forLat: lat, andLon: lon)
            .map { response in
                  response.daily.map(ForecastDailyViewModel.init)
                }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {  [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = []
                case .finished:
                    break
                }
            }
                  , receiveValue: { [weak self] weather in
                guard let self = self else { return }
                self.dataSource = weather.dropFirst().dropLast(2)
            })
            .store(in: &disposables)
    }
}

