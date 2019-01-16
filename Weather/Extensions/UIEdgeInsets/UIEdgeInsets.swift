//
//  UIEdgeInsets.swift
//  Weather
//
//  02/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    
    static var safeAreaInsets: UIEdgeInsets = {
        guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else { return UIEdgeInsets.zero }
        let insets: UIEdgeInsets
        if #available(iOS 11.0, *) {
            insets = window.safeAreaInsets
        } else {
            insets = UIEdgeInsets.zero
        }
        return insets
    }()
    
}
