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
            Spacer().frame(height: 20)
            VStack {
                HStack {
                    Image(systemName: "mappin.and.ellipse.circle.fill")
                        .font(.system(size: 30))
                    Text(weather.location.name)
                        .bold()
                        .font(.title)
                }
                VStack {
                    Text(String(format:"%.0f", weather.current.temp_c) + "°")
                        .font(.system(size: 100, weight: .heavy))
                    Text("Feels like \(String(format: "%.0f°", weather.current.feelslike_c))")
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            
            VStack{
                Text(weather.current.condition.text)
                    .font(.title2)
                AsyncImage(url: URL(string: "https:" + weather.current.condition.icon)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 150, height: 150)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            
            Spacer()
            
            VStack {
                Text("Wind speed: " + String(format: "%.2f KPH ", weather.current.wind_kph) + "— \(weather.current.wind_degree)° \(weather.current.wind_dir)")
            }
            .frame(maxWidth: .infinity, maxHeight: 30, alignment: .center)
            .padding()
            .background(.white.opacity(0.6))
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .foregroundStyle(.white)
        .background(weather.current.is_day == 1 ? Color(red: 0.01, green: 0.62, blue: 0.99) : Color(red: 0.03, green: 0.25, blue: 0.53))
    }
}


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: mockWeather)
    }
}
