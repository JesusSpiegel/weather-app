//
//  BaseViewController.swift
//  Weather
//
//  01/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let topSeparatorImageView: UIImageView = UIImageView()
    
    public var showTopSeparator: Bool = false {
        didSet {
            topSeparatorImageView.isHidden = !showTopSeparator
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

// MARK: - Setup views
extension BaseViewController {
    
    private func setupViews() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
        topSeparatorImageView.image = UIImage(named: "TopSeparator")
        topSeparatorImageView.isHidden = true
    }
    
}

// MARK: - Layout & constraints
extension BaseViewController {
    
    private struct Layout {
        
        struct TopSeparatorImageView {
            static let height: CGFloat = 2.0
        }
        
    }
    
    private func addSubviews() {
        view.addSubview(topSeparatorImageView)
        
        view.addConstraintsWithFormat("H:|[v0]|", views: topSeparatorImageView)
        view.addConstraintsWithFormat("V:|[v0(\(Layout.TopSeparatorImageView.height))]", views: topSeparatorImageView)
    }
    
    /**
     * Show alert
     *
     * - parameters:
     *      -title: title for the aler
     *      -message: message for the alert
     *      -actionTitle: action title for the alert
     */
    public func showAlertWith(title: String, message: String, actionTitle: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(
            title: actionTitle,
            style: .default,
            handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
}
