//
//  WeatherManager.swift
//  TableViewApp
//
//  Created by Lukman Makhaev on 01.12.2022.
//

import Foundation
import UIKit


protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {

    let weatherUrl = "https://api.openweathermap.org/data/2.5/forecast?id=524901&appid=63fa8b0b8a58d9ed68ebe8b23511bdd2&cnt=7&units=metric&q=london"

    var delegate: WeatherManagerDelegate?
    
    /*func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(with: urlString)
    }*/
    
    
    func fetchWeather() {
        performRequest(with: weatherUrl)
    }
    
    
    func performRequest(with urlString: String) {
        // 1.Create URL
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                if let safeData = data {
                    if let weathers = self.parseJSON(json: safeData) {
                        self.delegate?.didUpdateWeather(weather: weathers)
                        
                    }
                }
            }
            // 4.Start the task
            task.resume()
        }
    }
    
    
    
    
    
    
    func parseJSON(json: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            // Берем данные из сайта с JSON и помещаем их в weatherData
            //
            let decodedData = try decoder.decode(Weathers.self, from: json)
            let list = decodedData.list
            
            //let listItems = [list.inde]
            //print(list)

        
            
            
            //let listMain = list[0].main
            //let listWeather = list[0].weather[0]
            
            //
            
          
            //let id = listWeather.id
            //let descr = listWeather.description
            //let tempMin = listMain.temp_min
            //let tempMax = listMain.temp_max
            
            
            //let cityName = decodedData.city.name
            var weathersList = [WeatherModel.WeatherItem]()
            
            for (index, _) in list.enumerated() {
                //print(index)
                weathersList.append(WeatherModel.WeatherItem(conditionId: list[index].weather[0].id, description: list[index].weather[0].description, tempMin: list[index].main.temp_min, tempMax: list[index].main.temp_max))
            }
            
            //print(weathersList)
            
            
            
        
            let weathers = WeatherModel(weathersArray: weathersList)
            
            return weathers
            
        } catch {
            print(error)
            return nil
        }
      
    }
    
}
