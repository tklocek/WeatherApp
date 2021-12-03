//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-11-27.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject var viewModel: CurrentWeatherViewModel
    
    init(viewModel: CurrentWeatherViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView(topColor: Color("lightBackground"), bottomColor: Color("darkBackground"))
                VStack {
                    CityTextView(cityName: viewModel.city)
                    if let viewModel = viewModel.dataSource {
                        MainWeatherView(viewModel: viewModel)
                    }
                    Spacer()
                    NavigationLink("Check forecast", destination: viewModel.chooseForecastView)
                        .padding(.bottom)
                        .foregroundColor(Color.white)
                    NavigationLink("Change city", destination: viewModel.chooseCityView)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .onAppear(perform: viewModel.refresh)
            }
        }
    }
}


struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 40, weight: .medium, design: .rounded))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let fetcher = WeatherFetcher()
            let viewModel = CurrentWeatherViewModel(city: "Wrocław", weatherFecher: fetcher)
            CurrentWeatherView(viewModel: viewModel)
        }
    }
}








