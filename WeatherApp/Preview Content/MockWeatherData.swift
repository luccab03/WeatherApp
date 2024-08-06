//
//  MockWeatherData.swift
//  WeatherApp
//
//  Created by Lucca Bringhenti on 23/07/24.
//

import Foundation

let conditionCurrent = WeatherResponse.Condition(text: "Partly cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/116.png", code: 1003)
let current = WeatherResponse.Current(temp_c: 25.3, is_day: 1, condition: conditionCurrent, wind_kph: 15.0, wind_degree: 180, wind_dir: "S", feelslike_c: 26.0, cloud: 20)

let location = WeatherResponse.Location(name: "San Francisco", region: "CA", country: "USA", lat: 37.7749, lon: -122.4194)

let conditionDay = WeatherResponse.Condition(text: "Sunny", icon: "//cdn.weatherapi.com/weather/64x64/day/113.png", code: 1000)

let day = WeatherResponse.Forecast.Day(maxtemp_c: 28.0, mintemp_c: 18.0, avgtemp_c: 23.0, maxwind_kph: 20.0, avghumidity: 60, daily_will_it_rain: 0, daily_chance_of_rain: 0, condition: conditionDay)

let astro = WeatherResponse.Forecast.Astro(sunrise: "06:00 AM", sunset: "08:00 PM")

let conditionHour1 = WeatherResponse.Condition(text: "Clear", icon: "//cdn.weatherapi.com/weather/64x64/night/113.png", code: 1000)
let hour1 = WeatherResponse.Forecast.Hour(time: "2024-08-06 01:00", temp_c: 18.0, condition: conditionHour1, chance_of_rain: 0)

let conditionHour2 = WeatherResponse.Condition(text: "Cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/119.png", code: 1006)
let hour2 = WeatherResponse.Forecast.Hour(time: "2024-08-06 02:00", temp_c: 17.5, condition: conditionHour2, chance_of_rain: 10)

let conditionHour3 = WeatherResponse.Condition(text: "Partly cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/116.png", code: 1003)
let hour3 = WeatherResponse.Forecast.Hour(time: "2024-08-06 03:00", temp_c: 17.0, condition: conditionHour3, chance_of_rain: 5)

let conditionHour4 = WeatherResponse.Condition(text: "Clear", icon: "//cdn.weatherapi.com/weather/64x64/night/113.png", code: 1000)
let hour4 = WeatherResponse.Forecast.Hour(time: "2024-08-06 04:00", temp_c: 16.8, condition: conditionHour4, chance_of_rain: 0)

let conditionHour5 = WeatherResponse.Condition(text: "Clear", icon: "//cdn.weatherapi.com/weather/64x64/day/113.png", code: 1000)
let hour5 = WeatherResponse.Forecast.Hour(time: "2024-08-06 05:00", temp_c: 16.5, condition: conditionHour5, chance_of_rain: 0)

let conditionHour6 = WeatherResponse.Condition(text: "Sunny", icon: "//cdn.weatherapi.com/weather/64x64/day/113.png", code: 1000)
let hour6 = WeatherResponse.Forecast.Hour(time: "2024-08-06 06:00", temp_c: 17.2, condition: conditionHour6, chance_of_rain: 0)

let conditionHour7 = WeatherResponse.Condition(text: "Sunny", icon: "//cdn.weatherapi.com/weather/64x64/day/113.png", code: 1000)
let hour7 = WeatherResponse.Forecast.Hour(time: "2024-08-06 07:00", temp_c: 18.5, condition: conditionHour7, chance_of_rain: 0)

let conditionHour8 = WeatherResponse.Condition(text: "Sunny", icon: "//cdn.weatherapi.com/weather/64x64/day/113.png", code: 1000)
let hour8 = WeatherResponse.Forecast.Hour(time: "2024-08-06 08:00", temp_c: 20.0, condition: conditionHour8, chance_of_rain: 0)

let conditionHour9 = WeatherResponse.Condition(text: "Sunny", icon: "//cdn.weatherapi.com/weather/64x64/day/113.png", code: 1000)
let hour9 = WeatherResponse.Forecast.Hour(time: "2024-08-06 09:00", temp_c: 22.0, condition: conditionHour9, chance_of_rain: 0)

let conditionHour10 = WeatherResponse.Condition(text: "Sunny", icon: "//cdn.weatherapi.com/weather/64x64/day/113.png", code: 1000)
let hour10 = WeatherResponse.Forecast.Hour(time: "2024-08-06 10:00", temp_c: 24.0, condition: conditionHour10, chance_of_rain: 0)

let conditionHour11 = WeatherResponse.Condition(text: "Sunny", icon: "//cdn.weatherapi.com/weather/64x64/day/113.png", code: 1000)
let hour11 = WeatherResponse.Forecast.Hour(time: "2024-08-06 11:00", temp_c: 25.0, condition: conditionHour11, chance_of_rain: 0)

let conditionHour12 = WeatherResponse.Condition(text: "Partly cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/116.png", code: 1003)
let hour12 = WeatherResponse.Forecast.Hour(time: "2024-08-06 12:00", temp_c: 26.0, condition: conditionHour12, chance_of_rain: 10)

let conditionHour13 = WeatherResponse.Condition(text: "Cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/119.png", code: 1006)
let hour13 = WeatherResponse.Forecast.Hour(time: "2024-08-06 13:00", temp_c: 26.5, condition: conditionHour13, chance_of_rain: 15)

let conditionHour14 = WeatherResponse.Condition(text: "Cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/119.png", code: 1006)
let hour14 = WeatherResponse.Forecast.Hour(time: "2024-08-06 14:00", temp_c: 27.0, condition: conditionHour14, chance_of_rain: 20)

let forecastDay = WeatherResponse.Forecast.ForecastDay(date: "2024-08-06", day: day, astro: astro, hour: [hour1, hour2, hour3, hour4, hour5, hour6, hour7, hour8, hour9, hour10, hour11, hour12, hour13, hour14])

let forecast = WeatherResponse.Forecast(forecastday: [forecastDay])

let mockWeather = WeatherResponse(current: current, location: location, forecast: forecast)
