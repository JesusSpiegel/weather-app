//
//  TodayInteractor.swift
//  Weather
//
//  01/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import UIKit
import CoreLocation

class TodayInteractor {
    
    private let requestManager = RequestManager()
    private var lastRefreshDate: Date?
    
}

// MARK: - TodayInteractorInterface
extension TodayInteractor: TodayInteractorInterface {
    
    func requestLocationAuthorizationIfNeeded() {
        LocationManager.shared.requestAuthorizationIfNeeded()
    }
    
    func getCurrentWeather(completion: @escaping getWeatherInteractorCompletionBlock) {
        guard let currenLocation = LocationManager.shared.getCurrentLocation() else {
            completion(nil, false, nil)
            return
        }
        let latitude = CGFloat(currenLocation.latitude)
        let longitude = CGFloat(currenLocation.longitude)
        getWeatherWith(latitude: latitude, longitude: longitude) { [weak self] (response) in
            guard let `self` = self else { return }
            switch response {
            case .success(let weather):
                guard let weather = weather else {
                    completion(nil, false, nil)
                    return
                }
                self.addInformationWithWeatherResponse(weather, location: currenLocation)
                LocalWeatherManager.shared.saveLocalWeather(weather)
                let viewModel = TodayViewModel.getViewModelWith(weatherResponse: weather)
                self.lastRefreshDate = Date()
                completion(viewModel, true, nil)
                break
            case .failure(let error):
                completion(nil, false, error)
                break
            }
        }
    }
    
    func getLocalWeatherInformation() -> TodayViewModel? {
        guard let weatherResponse = LocalWeatherManager.shared.getLocalWeather() else {
            return nil
        }
        return TodayViewModel.getViewModelWith(weatherResponse: weatherResponse)
    }
    
    func shouldGetLocalWeatherInformation() -> Bool {
        return LocalWeatherManager.shared.localWeatherExists()
    }
    
    func shouldGetRemoteWeatherInformation() -> Bool {
        guard let lastRefreshDate = lastRefreshDate else {
            return true
        }
        
        let currentDate = Date()
        if currentDate.minutes(from: lastRefreshDate) >= 20 {
            return true
        }
        
        return false
    }
    
}

// MARK: - Private section
extension TodayInteractor {
    
    private func getWeatherWith(latitude: CGFloat, longitude: CGFloat, completion: @escaping getWeatherCompletionBlock) {
        var getWeatherRequest = WeatherRequest(latitude: latitude, longitude: longitude)
        
        getWeatherRequest.completion = completion
        requestManager.send(request: getWeatherRequest)
    }
    
    private func addInformationWithWeatherResponse(_ weatherResponse: WeatherResponse, location: CLLocationCoordinate2D) {
        guard let weather = weatherResponse.list.first, let userId = getCurrenUserId() else {
            return
        }
        RemoteDabaBaseManager.shared.addInformation(userId: userId, lastTemperature: weather.main.temp, latitude: location.latitude, longitude: location.longitude, countryCode: weatherResponse.city.country)
    }
    
    private func getCurrenUserId() -> String? {
        return LocalWeatherManager.shared.getCurrentUserId()
    }
    
}
