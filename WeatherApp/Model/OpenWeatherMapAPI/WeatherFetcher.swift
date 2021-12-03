//
//  WeatherFetcher.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-11-30.
//

import SwiftUI
import Combine

protocol WeatherFetchable{
    func weatherForecast(forLat lat: String, andLon lon: String) -> AnyPublisher<ForecastResponse, WeatherError>
    func currentWeather(forCiry city: String) -> AnyPublisher<CurrentWeatherResponse, WeatherError>
}

class WeatherFetcher {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}


//MARK: OpenWeather API
private extension WeatherFetcher {
    struct OpenWeatherAPI {
        static let key = "3c256165dbbffae78e0d13c28bf5dd38"
        static let scheme = "https"
        static let host = "api.openweathermap.org"
        static let path = "/data/2.5"
    }
    
    func makeForecastComponents(forLat lat: String, andLon lon: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = OpenWeatherAPI.scheme
        components.host = OpenWeatherAPI.host
        components.path = OpenWeatherAPI.path + "/onecall"
        
        components.queryItems = [
          URLQueryItem(name: "lat", value: lat),
          URLQueryItem(name: "lon", value: lon),
          URLQueryItem(name: "mode", value: "json"),
          URLQueryItem(name: "units", value: "metric"),
          URLQueryItem(name: "exclude", value: "minutely,alerts,hourly,current"),
          URLQueryItem(name: "appid", value: OpenWeatherAPI.key)
        ]
        
        return components
      }
    
    
    func makeCurrentWeatherComponenst(withCity city: String) -> URLComponents {
        var components = URLComponents()
        
        components.scheme = OpenWeatherAPI.scheme
        components.host = OpenWeatherAPI.host
        components.path = OpenWeatherAPI.path + "/weather"
        
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: OpenWeatherAPI.key)
        ]

        return components
    }
}


//MARK: WeatherFetchable
extension WeatherFetcher: WeatherFetchable {
    func weatherForecast(forLat lat: String, andLon lon: String) -> AnyPublisher<ForecastResponse, WeatherError> {
        let components = makeForecastComponents(forLat: lat, andLon: lon)
        return forecast(with: components)
    }
    
    func currentWeather(forCiry city: String) -> AnyPublisher<CurrentWeatherResponse, WeatherError> {
        return forecast(with: makeCurrentWeatherComponenst(withCity: city))
    }
    
    func forecast<T>(with components: URLComponents) -> AnyPublisher<T, WeatherError> where T: Decodable {
        guard let url = components.url else {
            let error = WeatherError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
    
}
