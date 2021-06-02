//
//  City.swift
//  ForecastApp
//
//  Created by Ali Korkmaz on 1.06.2021.
//

import Foundation

struct City: Codable {
    var id: Int
    var name: String
    var coord: Dictionary<String, Double?>
    var country: String
    var population: Int
    var timezone: Int
    var sunrise: Int
    var sunset: Int
}
