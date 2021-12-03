//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Tomasz Klocek on 2021-11-28.
//

import SwiftUI

struct ForecastView: View {
    @ObservedObject var viewModel: ForecastViewModel
    
    init(viewModel: ForecastViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: Color("lightBackground"), bottomColor: Color("darkBackground"))
            VStack{
                HStack {
                    if viewModel.dataSource.isEmpty {
                      Text("No results")
                        Button("Refresh data") {
                            viewModel.refresh()
                        }
                    } else {
                        ForEach(viewModel.dataSource) { result in
                                ForecastDailyView(viewModel: result)
                        }
                    }
                    
                }
                .navigationTitle(viewModel.city)
                .onAppear(perform: viewModel.refresh)
            }
        }
        
    }
}
