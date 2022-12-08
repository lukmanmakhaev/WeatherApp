//
//  Weather.swift
//  TableViewApp
//
//  Created by Lukman Makhaev on 01.12.2022.
//

import Foundation


struct List: Codable{
    var dt: Int
    var main: Main
    var weather: [Weather]
}


struct Main: Codable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var humidity: Int
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    
}
