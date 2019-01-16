//
//  ForecastProtocols.swift
//  Weather
//
//  02/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import Foundation

// View / Presenter
protocol ForecastViewInjection : class {
    func loadWeatherInformationWithViewModels(_ viewModels: [ForecastViewModel])
}

protocol ForecastPresenterDelegate : class {
    func viewDidDidAppear()
}

// Presenter / Interactor
protocol ForecastInteractorDelegate : class {
    func getWeatherInformation() -> [ForecastViewModel]?
}
