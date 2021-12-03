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
                        VStack {
                            CityTextView(cityName: viewModel.city)
                            if let viewModel = viewModel.dataSource {
                                MainWeatherView(viewModel: viewModel)
                            }
                            
        
                            Spacer()
                            NavigationLink("Check forecast", destination: ForecastView())
                                .padding(.bottom)
                            NavigationLink("Change city", destination: viewModel.chooseCityView)
                            Spacer()
                        }

                    }
                        .onAppear(perform: viewModel.refresh)
                        
            }
        }


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

struct WheatherDayView: View {
    var hour: String
    var imageName: String
    var temprature: Int
    
    var body: some View {
        VStack {
            Text(hour)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium, design: .rounded))
            Image (systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .top)
                .symbolRenderingMode(.multicolor)
            Text("\(temprature)°C")
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .medium, design: .rounded))
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


struct MainScreenWeatherView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image (systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150, alignment: .top)
                .symbolRenderingMode(.multicolor)
            Text("\(temperature) °C")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


