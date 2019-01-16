//
//  Utils.swift
//  Weather
//
//  01/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import UIKit

class Utils {
    
    public static func getDeviceLanguage() -> String {
        guard let languageCode = NSLocale.current.languageCode else {
            return "en"
        }
        return languageCode
    }
    
    public static func countryName(countryCode: String) -> String? {
        let current = NSLocale.current
        return current.localizedString(forRegionCode: countryCode)
    }

    
    public static func getCurrentUnitTemperature() -> UnitTemperature {
        return UnitTemperature.current
    }
    
    public static func getStringCurrentUnitTemperature() -> String {
        let currentUnit = UnitTemperature.current
        if currentUnit == .celsius {
            return "metric"
        }
        
        return "imperial"
    }
    
    public static func getWeatherSymbol() -> String {
        let currentUnit = UnitTemperature.current
        if currentUnit == .celsius {
            return "°C"
        }
        
        return "°F"
    }
    
    public static func degToCompass(_ deg: CGFloat) -> String {
        let val = floor(Double((deg / 22.5) + 0.5))
        let arr = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
        return arr[Int(val.truncatingRemainder(dividingBy: 16.0))]
    }
    
    public static func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public static func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    public static func takeScreenshot() -> UIImage? {
        var screenshotImage :UIImage?
        guard let layer = UIApplication.shared.keyWindow?.layer else { return nil }
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        layer.render(in:context)
        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return screenshotImage
    }
    
}
