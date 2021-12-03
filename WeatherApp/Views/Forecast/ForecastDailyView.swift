//
//  ForecastDailyView.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-12-03.
//

import Foundation
import SwiftUI


struct ForecastDailyView: View {
    private let viewModel: ForecastDailyViewModel
    
    init(viewModel: ForecastDailyViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text(viewModel.day)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium, design: .rounded))
            Image (systemName: viewModel.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .top)
                .symbolRenderingMode(.multicolor)
            Text("\(viewModel.temperature)°C")
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .medium, design: .rounded))
        }
    }
}
