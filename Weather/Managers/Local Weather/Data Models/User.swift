//
//  User.swift
//  Weather
//
//  03/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var userId: String?
    
    override class func primaryKey() -> String? {
        return "userId"
    }
}
