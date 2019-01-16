//
//  ShareManager.swift
//  Weather
//
//  03/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import UIKit

class ShareManager {
    
    static let shared: ShareManager = { return ShareManager() }()
    
    public func share(_ items: [Any], from: UIViewController) {
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        from.present(ac, animated: true)
    }

}
