//
//  MainWeatherView.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-12-02.
//

import SwiftUI


struct MainWeatherView: View {
    private let viewModel: MainWeatherViewModel
    
    init(viewModel: MainWeatherViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Image (systemName: viewModel.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150, alignment: .top)
                .symbolRenderingMode(.multicolor)
            Text("\(viewModel.temperature) °C")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
