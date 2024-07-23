//
//  SplashView.swift
//  WeatherApp
//
//  Created by Lucca Bringhenti on 23/07/24.
//

import Foundation
import SwiftUI
import CoreLocationUI


struct SplashView: View {
    @EnvironmentObject var locationController: LocationController
    
    var body: some View {
        VStack {
            Text("Welcome to the best Weather App")
                .bold()
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.bottom, 50)
            Text("To get started, click the button below to share your location")
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 50)
            
            LocationButton(.shareMyCurrentLocation) {
                locationController.requestUserLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
