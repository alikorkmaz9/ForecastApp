//
//  Ali.swift
//  ForecastApp
//
//  Created by Ali Korkmaz on 1.06.2021.
//

import Foundation

struct Ali: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [List]?
    let city: City?
}
