//
//  ForecastViewModel.swift
//  ForecastApp
//
//  Created by Ali Korkmaz on 3.06.2021.
//

import Foundation

//MARK: - Model
extension ViewController {
    struct Model {
        let time: String
        let image: URL
        let temp: Double
        
        init(time: String, image: URL, temp: Double) {
            self.time = time
            self.image = image
            self.temp = temp
        }
    }
}
