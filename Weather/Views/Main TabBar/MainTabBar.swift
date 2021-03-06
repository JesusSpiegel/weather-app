//
//  MainTabBar.swift
//  Weather
//
//  01/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {
    
    private var tabBarConfigured: Bool = false
    
    private let todayViewController: TodayViewController = TodayConfigurator.setupTodayModule()
    private let forecastViewController: ForecastViewController = ForecastRouter.setupModule()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTabBar()
    }
    
}

// MARK: - Private section
extension MainTabBar {
    
    private func configureTabBar() {
        if tabBarConfigured { return }
        
        let todayIcon = UIImage(named: "TodayIcon")?.withRenderingMode(.alwaysOriginal)
        let forecastIcon = UIImage(named: "ForecastIcon")?.withRenderingMode(.alwaysOriginal)
        
        let todaySelectedIcon = UIImage(named: "TodaySelectedIcon")?.withRenderingMode(.alwaysOriginal)
        let forecastSelectedIcon = UIImage(named: "ForecastSelectedIcon")?.withRenderingMode(.alwaysOriginal)
        
        let todayTabBarItem = UITabBarItem(title: NSLocalizedString("today.title", comment: ""), image: todayIcon, tag: 0)
        todayViewController.tabBarItem = todayTabBarItem
        todayViewController.tabBarItem.selectedImage = todaySelectedIcon
        
        let forecastTabBarItem = UITabBarItem(title: NSLocalizedString("forecast.title", comment: ""), image: forecastIcon, tag: 1)
        forecastViewController.tabBarItem = forecastTabBarItem
        forecastViewController.tabBarItem.selectedImage = forecastSelectedIcon
        
        let todayNagivationViewController = UINavigationController(rootViewController: todayViewController)
        let forecastNavigationViewController = UINavigationController(rootViewController: forecastViewController)
        
        viewControllers = [todayNagivationViewController, forecastNavigationViewController]
        
        tabBarConfigured = true
    }
    
}
