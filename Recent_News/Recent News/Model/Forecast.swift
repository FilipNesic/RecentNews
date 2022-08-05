//
//  Forecast Model.swift
//  Recent News
//
//  Created by Filip  on 12.4.22..
//

import Foundation

struct WeatherRoot: Codable {
    
    var weather: [Weather]?
    var main: Main?
    var wind: Wind?
    var name: String?
    
}

struct Weather: Codable {
    
    var description: String?
    var main: String?
}

struct Main: Codable {
    
    var temp: Float?
    var feelsLike: Float?
    
    private enum CodingKeys: String, CodingKey {
        
        case temp
        case feelsLike = "feels_like"
    }
}

struct Wind: Codable {
    
    var speed: Float?
}


