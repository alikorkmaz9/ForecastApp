//
//  List.swift
//  ForecastApp
//
//  Created by Ali Korkmaz on 1.06.2021.
//

import Foundation

struct List: Codable {
    var dt: Int
    var main: Dictionary<String, Double?>
    var weather: [Weather]?
    var clouds: Dictionary<String, Double?>
    var wind: Dictionary<String, Double?>
    var visibility: Int
    var pop: Double
    var sys: Dictionary<String, String?>
}
