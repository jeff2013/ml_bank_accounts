//
//  AccountsViewController.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit
import SVProgressHUD

class AccountsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.setTitle(title: "Accounts.Navigation.Title".localized)
            title = "Accounts.Navigation.Title".localized
            //            navigationController?.navigationBar.largeTitleTextAttributes =
            //                [NSAttributedStringKey.font: UIFont(.helveticaNeueMedium, size: 30),
            //                 NSAttributedStringKey.foregroundColor: UIColor(.azureBlue)]
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func retrieveAccounts() {
        SVProgressHUD.show()
        BankService.retrieveAccounts { (response) in
            SVProgressHUD.dismiss()
            if response.error != nil {
                print(response.result.value)
            } else {
                SVProgressHUD.showError(withStatus: "PLACEHOLDER")
            }
        }
    }
}
