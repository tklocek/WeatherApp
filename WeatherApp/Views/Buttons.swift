//
//  Buttons.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-11-30.
//

import SwiftUI

struct MainButtonView: View {
    var name: String
    
    var body: some View {
        Button {
            print("Check forecast")
        } label: {
            Text(name)
                .frame(width: 250, height: 30)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
    }
}


struct TopButton: View {
    var side: Edge.Set
    var name: String
    
    var body: some View {
        Button {
            print(name)
        } label: {
            Text(name)
                .foregroundColor(.white)
        }
        .padding(side)
            
            
    }
}

