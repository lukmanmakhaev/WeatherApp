//
//  Weather.swift
//  TableViewApp
//
//  Created by Lukman Makhaev on 26.11.2022.
//

import Foundation
import UIKit


//1
struct WeatherObject: Codable {
    var list: [List]
    var city: City
}

//1


//2
struct List: Codable {
    var dt: Int
    var main: Main
    var weather: Weather
}

struct City: Codable {
    var id: Int
    var name: String
    var coord: Coord
}

//2


//3
// list //
struct Main: Codable {
    var temp: Double
    var feels_like: String
    var humidity: Int
}

struct Weather: Codable {
    var id: Int
    var description: String
    
}
// list //

// city //
struct Coord: Codable {
    var lat: Double
    var lon: Double
}
// city //
//3
