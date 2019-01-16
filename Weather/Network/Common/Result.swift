//
//  Result.swift
//
//  03/09/2018.
//  Copyright © 2018. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(ResultError)
}
