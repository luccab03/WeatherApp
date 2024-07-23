//
//  ContentView.swift
//  WeatherApp
//
//  Created by Lucca Bringhenti on 22/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationController = LocationController()
    var weatherController = WeatherController()
    @State var weather: WeatherResponse?
    
    var body: some View {
        VStack {
            if let location = locationController.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    Loading()
                        .task {
                            do {
                                weather = try await weatherController.getWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Oops", error)
                            }
                        }
                }
            } else {
                if locationController.isLoading {
                    Loading()
                } else {
                    SplashView().environmentObject(locationController)
                }
            }
        }
    }
}

struct Loading: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
