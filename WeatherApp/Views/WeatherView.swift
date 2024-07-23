//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Lucca Bringhenti on 23/07/24.
//

import Foundation
import SwiftUI

struct WeatherView: View {
    var weather: WeatherResponse
    var body: some View {
        VStack{
            Text(weather.location.name)
            Text(String(weather.current.feelslike_c) + "°")
        }
    }
}
