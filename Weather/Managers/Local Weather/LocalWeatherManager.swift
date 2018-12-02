//
//  LocalWeatherManager.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation
import RealmSwift

class LocalWeatherManager {
    
    /**
     * Save current weather
     *
     * - parameters:
     *      -weather: current weather to save
     */
    public static func saveLocalWeather(_ weather: WeatherResponse) {
        //Remove older local weather
        deleteLocalWeather()
        
        // Create a suggestion object
        let localWeatherModel = LocalWeather()
        localWeatherModel.weatherId = UUID().uuidString
        localWeatherModel.weatherData = archive(w: weather)
        
        // Get the default Realm
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(localWeatherModel)
        }
    }
    
    /**
     * Get all suggestions
     */
    public static func getLocalWeather() -> WeatherResponse? {
        // Get the default Realm
        let realm = try! Realm()
        
        // Query Realm for all local weather
        guard let localWeather = realm.objects(LocalWeather.self).first, let weatherData = localWeather.weatherData else {
            return nil
        }

        return unarchive(d: weatherData)
    }
    
    /**
     * Delete all local weather
     */
    public static func deleteLocalWeather() {
        let realm = try! Realm()
        let localWeather = realm.objects(LocalWeather.self)
        
        try! realm.write {
            realm.delete(localWeather)
        }
    }
    
    /**
     * Validate if suggestion exists in the database
     *
     * - parameters:
     *      -suggestion: suggestion to check
     */
//    public static func suggestionExists(_ suggestion: String) -> Bool {
//        let realm = try! Realm()
//        let suggestions = realm.objects(IMSearchSuggestion.self).filter("suggestion == %@", suggestion.lowercased())
//        return suggestions.count == 1
//    }
    
    public static func archive(w: WeatherResponse) -> Data {
        var fw = w
        return Data(bytes: &fw, count: MemoryLayout<WeatherResponse>.stride)
    }
    
    static func unarchive(d: Data) -> WeatherResponse {
        guard d.count == MemoryLayout<WeatherResponse>.stride else {
            fatalError("Error!")
        }
        
        var w: WeatherResponse?
        d.withUnsafeBytes({(bytes: UnsafePointer<WeatherResponse>) -> Void in
            w = UnsafePointer<WeatherResponse>(bytes).pointee
        })
        return w!
    }
    
}
