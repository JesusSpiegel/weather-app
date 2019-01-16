//
//  UnitTemperature.swift
//  Weather
//
//  01/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import Foundation

extension UnitTemperature {
    
    private struct Config {
        static let defaultCelsiusValue: String = "0°C"
    }
    
    static var current: UnitTemperature {
        let measureFormatter = MeasurementFormatter()
        let measurement = Measurement(value: 0, unit: UnitTemperature.celsius)
        let output = measureFormatter.string(from: measurement)
        return output == Config.defaultCelsiusValue ? .celsius : .fahrenheit
    }
    
}
