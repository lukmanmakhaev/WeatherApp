//
//  WeatherModel.swift
//  TableViewApp
//
//  Created by Lukman Makhaev on 27.11.2022.
//

import UIKit

struct WeatherModel {
    let conditionId: Int
    let description: String
    let tempMin: Double
    let tempMax: Double
    
    //var temperatureString: String {
        //let string = String(format: "%.1f", temp)
        //return string
    //}
    
    var tempMinString: String {
        let string = String(format: "%.0f", tempMin)
        return string
    }
    
    var tempMaxString: String {
        let string = String(format: "%.0f", tempMax)
        return string
    }
    
    var tempRate: String {
        let string = "\(tempMinString)º / \(tempMaxString)º"
        return string
    }
    
    var condition: UIImage {
        switch conditionId {
        case 200...232:
            return Images.thunderstorm
        case 300...321:
            return Images.hail
        case 500...531:
            return Images.rain
        case 600...622:
            return Images.snow
        case 700...781:
            return Images.fog
        case 800:
            return Images.sun
        case 801...804:
            return Images.cloud
        default:
            return Images.cloud
        }
    }
}

