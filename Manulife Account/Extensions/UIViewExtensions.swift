//
//  UIViewExtensions.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public class func instanceFromStoryboard<T>(storyboard: Storyboard) -> T {
        return UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
    
    public class func initialViewControllerFromStoryboard<T>(storyboard: Storyboard) -> T {
        return UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateInitialViewController() as! T
    }
    
    func setTitle(title: String) {
        navigationItem.title = title
        setBackButton()
    }
    
    func setTitleView(view: UIView) {
        navigationItem.titleView = view
        setBackButton()
    }
    
    private func setBackButton() {
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
}

