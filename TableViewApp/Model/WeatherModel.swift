//
//  WeatherModel.swift
//  TableViewApp
//
//  Created by Lukman Makhaev on 27.11.2022.
//



//Data
import UIKit

struct WeatherModel {
    
    
    let weathersArray: [WeatherItem]
    
    //let cityName: String
    
    struct WeatherItem {
        
        let dt: Int
        let conditionId: Int
        let description: String
        let temp: Double
        let tempMin: Double
        let tempMax: Double
        let hmdty: Int
        
        //var temperatureString: String {
        //let string = String(format: "%.1f", temp)
        //return string
        //}
    
        
        var humidityString: String {
            let string = String("Hmdty: \(hmdty)")
            return string
        }
        
        var tempString: String {
            let string = String(format: "%.1f", temp)
            return string
        }
        
        
        var tempMaxString: String {
            switch tempMax{
            case -0.9..<1:
                return "0"
            default:
                return String(format: "%.0f", tempMax)
            }
        }
        
        var tempMinString: String {
            switch tempMin{
            case -0.9..<1:
                return "0"
            default:
                return String(format: "%.0f", tempMin)
            }
        }
        
        var tempRate: String {
            let string = "\(tempMinString)º / \(tempMaxString)º"
            return string
        }
        
        var weekDay: String {
            return createDateTime(timestamp: String(dt))
        }
        
        var dayAndDesc: String {
            return "\(weekDay) • \(description)"
        }
        
        func createDateTime(timestamp: String) -> String {
            var strDate: String?
                
            if let unixTime = Double(timestamp) {
                let date = Date(timeIntervalSince1970: unixTime)
                let dateFormatter = DateFormatter()
                let timezone = TimeZone.current.abbreviation() ?? "CET"  // get current TimeZone abbreviation or set to CET
                dateFormatter.timeZone = TimeZone(abbreviation: timezone) //Set timezone that you want
                dateFormatter.locale = NSLocale.current
                dateFormatter.dateFormat = "HH:mm" //Specify your format that you want
                strDate = dateFormatter.string(from: date)
            }
                
            return strDate!
        }
        
        var condition: String {
            switch conditionId {
            case 200...232:
                return "cloud.bolt"
            case 300...321:
                return "cloud.hail"
            case 500...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 700...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud"
            default:
                return "cloud"
            }
        }
    }
}

