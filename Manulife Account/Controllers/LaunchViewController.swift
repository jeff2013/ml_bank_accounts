//
//  LaunchViewController.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet var openButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        openButton.setTitle("Launch.Open".localized, for: .normal)
    }
    

    @IBAction func openApplication(_ sender: Any) {
        login()
    }
    
    func login() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.switchToAccounts()
    }

}
