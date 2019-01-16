//
//  InternalNotifications.swift
//  Weather
//
//  01/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let locationAllowed = Notification.Name("locationAllowed")
    static let locationDenied = Notification.Name("locationDenied")
    static let currentLocationChanged = Notification.Name("currentLocationChanged")
}
