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
        if Connectivity.isConnectedToInternet() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.switchToAccounts()
        } else {
            let alert = UIAlertController(title: "General.No.Connection".localized, message: "General.No.Connection.Message".localized, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "General.Cancel".localized, style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}
