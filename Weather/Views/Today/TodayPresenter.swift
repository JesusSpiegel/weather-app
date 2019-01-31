//
//  TodayPresenter.swift
//  Weather
//
//  01/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import UIKit

typealias getWeatherCompletionBlock = (Result<WeatherResponse?>) -> Void

class TodayPresenter {
    
    weak var view: TodayViewInterface?
    var interactor: TodayInteractorInterface?
}

// MARK: - TodayPresenterInterface
extension TodayPresenter: TodayPresenterInterface {
    
    func viewDidLoad() {
        validateLocalData()
        registerInternalNotifications()
    }
    
    func viewDidAppear() {
        interactor?.requestLocationAuthorizationIfNeeded()
    }
    
}

// MARK: - Private section
extension TodayPresenter {
    
    private func registerInternalNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(locationAllowed), name: .locationAllowed, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(currenLocationChanged), name: .currentLocationChanged, object: nil)
    }
    
    @objc private func locationAllowed() {
        
        guard let interactor = interactor else {
            return
        }
        
        if !interactor.shouldGetRemoteWeatherInformation() {
            return
        }
        
        getCurrentWeatherInformation()
    }
    
    @objc private func currenLocationChanged() {
        getCurrentWeatherInformation()
    }
    
    func getCurrentWeatherInformation() {
        interactor?.getCurrentWeather { [weak self] (viewModel, success, error) in
            guard let `self` = self else { return }
            
            if let viewModel = viewModel {
                self.view?.loadWeatherInformationWithViewModel(viewModel)
                return
            }
            
            if let error = error {
                self.view?.showMessageWith(title: NSLocalizedString("error.title", comment: ""), message: error.localizedDescription, actionTitle: NSLocalizedString("error.action_title", comment: ""))
                return
            }
            
            if !success {
                self.view?.showMessageWith(title: NSLocalizedString("error.title", comment: ""), message: NSLocalizedString("error.message", comment: ""), actionTitle: NSLocalizedString("error.action_title", comment: ""))
                return
            }
        }
    }
    
    private func validateLocalData() {
        
        guard let interactor = interactor else {
            return
        }
        
        if !interactor.shouldGetLocalWeatherInformation() { return }
        
        guard let viewModel = interactor.getLocalWeatherInformation() else {
            return
        }
        
        view?.loadWeatherInformationWithViewModel(viewModel)
    }
    
}
