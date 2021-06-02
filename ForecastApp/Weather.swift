//
//  Weather.swift
//  ForecastApp
//
//  Created by Ali Korkmaz on 1.06.2021.
//

import Foundation

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
