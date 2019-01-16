//
//  WeatherRequest.swift
//  Weather
//
//  29/11/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import UIKit

struct WeatherRequest: RequestProtocol {
    typealias ResponseType = WeatherResponse
    var completion: ((Result<WeatherResponse?>) -> Void)?
    var method: HTTPMethod = .get
    var url: URL? = nil
    var encodableBody: Encodable? = nil
    var simulatedResponseJSONFile: String?
    var verbose: Bool?
    
    init(latitude: CGFloat, longitude: CGFloat) {
        url = Endpoint.getWeatherWith(latitude: latitude, longitude: longitude).url
    }
    
}
