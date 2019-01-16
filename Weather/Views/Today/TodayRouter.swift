//
//  TodayRouter.swift
//  Weather
//
//  01/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import UIKit

class TodayRouter {
    
    public static func setupModule(navigationController: UINavigationController? = nil) -> TodayViewController {
        let todayVC = TodayViewController()
        todayVC.presenter = TodayPresenter(view: todayVC, navigationController: navigationController)
        return todayVC
    }
    
}
