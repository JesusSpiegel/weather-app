//
//  LocalWeather.swift
//  Weather
//
//  02/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import Foundation
import RealmSwift

class LocalWeather: Object {
    @objc dynamic var weatherId: String?
    @objc dynamic var weatherData: Data? = nil
    
    override class func primaryKey() -> String? {
        return "weatherId"
    }
}
