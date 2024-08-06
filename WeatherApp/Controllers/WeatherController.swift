//
//  WeatherController.swift
//  WeatherApp
//
//  Created by Lucca Bringhenti on 22/07/24.
//

import Foundation
import CoreLocation

class WeatherController {
    private let apiKey = ""
    
    func getWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherResponse {
        guard let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(latitude),\(longitude)&days=3&aqi=no&alerts=no") else {fatalError("Missing URL")}
        let req = URLRequest(url: url)
        let (data, res) = try await URLSession.shared.data(for: req)
        
        guard (res as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while getting data from WeatherAPI.")}
        
        let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return decodedData
    }
}


struct WeatherResponse: Decodable {
    var current: Current
    var location: Location
    var forecast: Forecast
    
    struct Location: Decodable {
        var name: String
        var region: String
        var country: String
        var lat: Double
        var lon: Double
    }
    
    struct Condition: Decodable {
        var text: String
        var icon: String
        var code: Int
    }
    
    struct Current: Decodable {
        var temp_c: Double
        var is_day: Int
        var condition: Condition
        var wind_kph: Double
        var wind_degree: Int
        var wind_dir: String
        var feelslike_c: Double
        var cloud: Int
    }
    
    struct Forecast: Decodable {
        var forecastday: [ForecastDay]
        
        struct ForecastDay: Decodable {
            var date: String
            var day: Day
            var astro: Astro
            var hour: [Hour]
        }
        
        struct Day: Decodable {
            var maxtemp_c: Double
            var mintemp_c: Double
            var avgtemp_c: Double
            var maxwind_kph: Double
            var avghumidity: Int
            var daily_will_it_rain: Int
            var daily_chance_of_rain: Int
            var condition: Condition
        }
        
        struct Astro: Decodable {
            var sunrise: String
            var sunset: String
        }
        
        struct Hour: Decodable {
            var time: String
            var temp_c: Double
            var condition: Condition
            var chance_of_rain: Int
        }
    }
}
