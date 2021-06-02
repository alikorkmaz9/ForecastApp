//
//  ForecastDataSource.swift
//  ForecastApp
//
//  Created by Ali Korkmaz on 2.06.2021.
//

import Foundation

var cityName: String!
var weatherDescription: String!

//MARK: - Parsing
extension ViewController {
    
    func parse() {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=izmir&APPID=bbcf57969e78d1300a815765b7d587f0&units=metric"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                //print(data)
                let decoder = JSONDecoder()
                
                do {
                    if let weathers = try? decoder.decode(ForecastResponseModel.self, from: data) {
                        // we re ok to Parse
                        if let dateTimes = weathers.list {
                            for dateTime in dateTimes {
                                //print(dateTime.dateTime)
                                //print(dateTimes.count)
                            }
                        }
                        if let city = weathers.city {
                            cityName = city.name
                        }
                        if let descriptions = weathers.list {
                            for description in descriptions {
                                weatherDescription = (description.weather![0].main)
                                break
                            }
                            }
                    }
                } catch {
                    print("failed")
                }
            }
        }
    }
}

