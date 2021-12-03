//
//  WeatherError.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-11-30.
//

import Foundation

enum WeatherError: Error {
  case parsing(description: String)
  case network(description: String)
}

