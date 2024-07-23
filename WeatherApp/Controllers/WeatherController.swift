//
//  WeatherController.swift
//  WeatherApp
//
//  Created by Lucca Bringhenti on 22/07/24.
//

import Foundation
import CoreLocation

struct WeatherResponse: Decodable {
    var current: Current
    var location: Location
    
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
        var temp_f: Double
        var is_day: Int
        var condition: Condition
        var wind_mph: Double
        var wind_kph: Double
        var wind_degree: Int
        var wind_dir: String
        var feelslike_c: Double
        var feelslike_f: Double
        var cloud: Int
    }
    
}

class WeatherController {
    private let apiKey = "5b62b20351aa4ed8818193637242207"
    
    func getWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherResponse {
        guard let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(latitude),\(longitude)&aqi=no") else {fatalError("Missing URL")}
        let req = URLRequest(url: url)
        let (data, res) = try await URLSession.shared.data(for: req)
        
        guard (res as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while getting data from WeatherAPI.")}
        
        let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return decodedData
    }
}
        
