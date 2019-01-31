//
//  TodayProtocols.swift
//  Weather
//
//  01/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import Foundation

// View / Presenter
protocol TodayViewInterface : class {
    func loadWeatherInformationWithViewModel(_ viewModel: TodayViewModel)
    func showMessageWith(title: String, message: String, actionTitle: String)
}

protocol TodayPresenterInterface : class {
    func viewDidLoad()
    func viewDidAppear()
}

// Presenter / Interactor
typealias getWeatherInteractorCompletionBlock = (_ viewModel: TodayViewModel?, _ success: Bool, _ error: ResultError?) -> Void

protocol TodayInteractorInterface : class {
    func requestLocationAuthorizationIfNeeded()
    func getCurrentWeather(completion: @escaping getWeatherInteractorCompletionBlock)
    func getLocalWeatherInformation() -> TodayViewModel?
    func shouldGetLocalWeatherInformation() -> Bool
    func shouldGetRemoteWeatherInformation() -> Bool
}
