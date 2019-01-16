//
//  ForecastInteractor.swift
//  Weather
//
//  02/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import Foundation

class ForecastInteractor {
}

// MARK: - ForecastInteractorDelegate
extension ForecastInteractor: ForecastInteractorDelegate {
    
    func getWeatherInformation() -> [ForecastViewModel]? {
        guard let weatherResponse = LocalWeatherManager.shared.getLocalWeather() else {
            return nil
        }
        return ForecastViewModel.getViewModelsWith(weatherResponse: weatherResponse)
    }
    
}
