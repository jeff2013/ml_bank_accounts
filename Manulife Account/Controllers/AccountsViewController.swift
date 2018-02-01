//
//  AccountsViewController.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit
import SVProgressHUD

enum AccountTypes: Int {
    case deposit
    case investments
    case count
    
    func description() -> String {
        switch self {
        case .deposit:
            return "Accounts.Type.Deposit".localized
        case .investments:
            return "Accounts.Type.Investments".localized
        default:
            return ""
        }
    }
}

class AccountsViewController: UIViewController {

    @IBOutlet weak var accountsTableView: UITableView!
    
    var accounts: [Account] = []
    
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
                if let accounts = response.value {
                    self.accounts = accounts
                    self.accountsTableView.reloadData()
                } else {
                    //no accounts retrieved, could show some sort of notification that there are none available
                }
            } else {
                SVProgressHUD.showError(withStatus: "PLACEHOLDER")
            }
        }
    }
}

extension AccountsViewController: UITableViewDelegate {
    
}

extension AccountsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return AccountTypes.count.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let accountCell: AccountTableViewCell = tableView.dequeueReusableCell(type: AccountTableViewCell.self) as! AccountTableViewCell
        accountCell.configureCell(object: accounts[indexPath.row])
        return accountCell
    }
}
