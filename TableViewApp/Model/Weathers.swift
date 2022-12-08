//
//  Weather.swift
//  TableViewApp
//
//  Created by Lukman Makhaev on 26.11.2022.
//

import Foundation
import UIKit


//1
struct Weathers: Codable {
    var message: Int
    var list: [List]
    var city: City
}

//1


//2

struct City: Codable {
    var id: Int
    var name: String
}

//2


//3
// list //
/*struct Main: Codable {
    var temp: Double
    var feels_like: String
    var temp_min: Double
    var temp_max: Double
    var humidity: Int
}

struct Weather: Codable {
    var id: Int
    var main: String
    
}*/
// list //
