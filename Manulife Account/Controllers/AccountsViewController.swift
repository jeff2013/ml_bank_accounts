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
    
    var depositAccounts: [Account] {
        get {
            return accounts.filter { (acc) -> Bool in
                return acc.id < 18
            }
        }
    }
    
    var investmentAccounts: [Account] {
        get {
            return accounts.filter { (acc) -> Bool in
                return acc.id >= 19
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        retrieveAccounts()
        setupTableView()
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
    
    func setupTableView() {
        accountsTableView.registerCellType(type: AccountTableViewCell.self)
        accountsTableView.registerCellType(type: SimpleSectionTableViewCell.self)
        accountsTableView.tableFooterView = UIView()
        accountsTableView.estimatedRowHeight = 200
        accountsTableView.estimatedSectionHeaderHeight = 200
    }
    
    func retrieveAccounts() {
        SVProgressHUD.show()
        BankService.retrieveAccounts { (response) in
            SVProgressHUD.dismiss()
            if response.error == nil {
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let simpleSectionCell: SimpleSectionTableViewCell = tableView.dequeueReusableCell(type: SimpleSectionTableViewCell.self)
        
        switch AccountTypes(rawValue: section)! {
        case .deposit:
             simpleSectionCell.configureCell(object: ("Accounts.Type.Deposit".localized, depositAccounts.count))
        case .investments:
            simpleSectionCell.configureCell(object: ("Accounts.Type.Investments".localized, investmentAccounts.count))
        default: break
        }
        
        return simpleSectionCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch AccountTypes(rawValue: section)! {
        case .deposit:
            return depositAccounts.count
        case .investments:
            return investmentAccounts.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var accountsForSection: [Account] = []
        switch AccountTypes(rawValue: indexPath.section)! {
        case .deposit:
            accountsForSection = depositAccounts
        case .investments:
            accountsForSection = investmentAccounts
        default:
            break
        }
        let accountCell: AccountTableViewCell = tableView.dequeueReusableCell(type: AccountTableViewCell.self)
        accountCell.configureCell(object: accountsForSection[indexPath.row])
        return accountCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
