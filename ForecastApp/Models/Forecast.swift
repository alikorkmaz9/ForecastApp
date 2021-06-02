//
//  Forecast.swift
//  ForecastApp
//
//  Created by Ali Korkmaz on 2.06.2021.
//

import Foundation

// MARK: - ForecastResponseModel
struct ForecastResponseModel: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [Forecast]?
    let city: City?
}

// MARK: - Forecast
struct Forecast: Codable {
    var dateTime: Int
    var main: MainClass?
    var weather: [Weather]?
    var clouds: Dictionary<String, Double>
    var wind: Dictionary<String, Double>
    var visibility: Int
    var pop: Double
    var sys: Dictionary<String, String>
    var dateText: String
    
    private enum CodingKeys: String, CodingKey {
        case dateTime = "dt"
        case main
        case weather
        case clouds
        case wind
        case visibility
        case pop
        case sys
        case dateText = "dt_txt"
        
    }
}

// MARK: - City
struct City: Codable {
    var id: Int
    var name: String
    var coord: Dictionary<String, Double>
    var country: String
    var population: Int
    var timezone: Int
    var sunrise: Int
    var sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}
