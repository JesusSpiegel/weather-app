//
//  RepoResponse.swift
//  Weather
//
//  29/11/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import UIKit

public struct WeatherResponse: Codable {
    let cod: String
    let message: CGFloat
    let cnt: UInt
    let list: [WeatherListResponse]
    let city: WeatherCityResponse
}

public struct WeatherListResponse: Codable {
    let dt: Double
    let main: WeatherListMainResponse
    let weather: [WeatherListWeatherResponse]
    let wind: WeatherListWindResponse
    let rain: WeatherRainResponse?
}

public struct WeatherRainResponse: Codable {
    let rain3h: CGFloat?
    
    //__ This is little trick.
    //__ The "rain" field has another field inside called "3h"
    //__ The problem is we can't process this field using Swift
    //__ so we need to create an enum like a "bridge" to process the field
    enum CodingKeys: String, CodingKey {
        case rain3h = "3h"
    }
}

public struct WeatherListMainResponse: Codable {
    let temp: CGFloat
    let temp_min: CGFloat
    let temp_max: CGFloat
    let pressure: CGFloat
    let sea_level: CGFloat
    let grnd_level: CGFloat
    let humidity: Int
    let temp_kf: CGFloat
}

public struct WeatherListWeatherResponse: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

public struct WeatherListWindResponse: Codable {
    let speed: CGFloat
    let deg: CGFloat
}

public struct WeatherCityResponse: Codable {
    let id: Int64
    let name: String
    let coord: WeatherCityCoordResponse
    let country: String
    let population: Int64?
}

public struct WeatherCityCoordResponse: Codable {
    let lat: CGFloat
    let lon: CGFloat
}
