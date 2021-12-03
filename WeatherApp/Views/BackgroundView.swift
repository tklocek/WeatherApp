//
//  BackgroundView.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-11-30.
//

import SwiftUI

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(
            colors: [topColor, bottomColor],
            startPoint: .top, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
