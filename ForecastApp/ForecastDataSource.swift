//
//  ForecastDataSource.swift
//  ForecastApp
//
//  Created by Ali Korkmaz on 2.06.2021.
//

import Foundation

var cityName: String!
var weatherDescription: String!
var avgTemp: String!
var temperatures = [Double]()
var time = [String]()
var imageUrl = [URL]()

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
                                let unixConvertedDate = Date(timeIntervalSince1970: TimeInterval(dateTime.dateTime))
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateStyle = .long
                                dateFormatter.dateFormat = "EEEEE"
                                dateFormatter.timeStyle = .none
                                time.append(unixConvertedDate.dayOfTheWeek())
                                
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
                        
                        if let temps = weathers.list {
                            for temp in temps {
                                if let nowTemp = temp.main!.temp {
                                    avgTemp = String(Int(nowTemp))
                                    break
                                }
                            }
                        }
                        
                        if let temps = weathers.list {
                            for temp in temps {
                                if let dummy = temp.main!.temp {
                                    temperatures.append(dummy)
                                }
                            }
                        }
                        
                        if let icons = weathers.list {
                            for icon in icons {
                                if let dummy = icon.weather?[0].icon {
                                    let baseUrl = "http://openweathermap.org/img/w/"
                                    imageUrl.append(URL(string: baseUrl + dummy + ".png")!)
                                }
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

//MARK: DateFormatter
extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}

