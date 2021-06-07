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
var day = [String]()

//MARK: - Parsing
/* extension ViewController {
    func parse() {
    let urlGetData = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=izmir&APPID=bbcf57969e78d1300a815765b7d587f0&units=metric")
    let session = URLSession.shared
    
    // Closure
    let task = session.dataTask(with: urlGetData!) { (data, response, error) in
        if error != nil {
            //let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
            //let okButton = UIAlertAction (title: "OK", style: UIAlertAction.Style.default, handler: nil)
            //alert.addAction(okButton)
            //self.present(alert, animated: true, completion: nil)
            
        } else {
            
            // 2.
            if data != nil {
                let decoder = JSONDecoder()
                do {
                        if let weathers = try? decoder.decode(ForecastResponseModel.self, from: data!) {
                        // we re ok to Parse
                            DispatchQueue.main.async {
                        if let dateTimes = weathers.list {
                            for dateTime in dateTimes {
                                let unixConvertedDate = Date(timeIntervalSince1970: TimeInterval(dateTime.dateTime))
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateStyle = .long
                                dateFormatter.dateFormat = "EEE"
                                dateFormatter.timeStyle = .none
                                time.append(unixConvertedDate.hourOfTheDay())
                                day.append(unixConvertedDate.dayOfTheWeek())
                            }
                            day = day.uniqued()
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
                        }
                } catch {
                    print("error")
                }
            }
        }
    }
        task.resume()
    }
} */

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
                                dateFormatter.dateFormat = "EEE"
                                dateFormatter.timeStyle = .none
                                time.append(unixConvertedDate.hourOfTheDay())
                                day.append(unixConvertedDate.dayOfTheWeek())
                            }
                            day = day.uniqued()
                            print(day)
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
    func hourOfTheDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

//MARK: -UniqueElement
extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
