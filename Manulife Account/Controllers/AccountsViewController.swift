//
//  AccountsViewController.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit
import SVProgressHUD

enum AccountCategories: Int {
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
        accountsTableView.registerCellTypes(types: [AccountTableViewCell.self, SimpleSectionTableViewCell.self, SimpleFooterTableViewCell.self])
        accountsTableView.tableFooterView = UIView()
        accountsTableView.estimatedRowHeight = 200
        accountsTableView.estimatedSectionHeaderHeight = 200
        accountsTableView.estimatedSectionFooterHeight = 200
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
    
    func getAccounts(for section: Int) -> [Account] {
        var accountsForSection: [Account] = []
        switch AccountCategories(rawValue: section)! {
        case .deposit:
            accountsForSection = depositAccounts
        case .investments:
            accountsForSection = investmentAccounts
        default:
            break
        }
        return accountsForSection
    }
}

extension AccountsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var accountsForSection: [Account] = getAccounts(for: indexPath.section)
        AccountTypes(rawValue: accountsForSection[indexPath.row].id)
    }
    
}

extension AccountsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return AccountCategories.count.rawValue
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerCell: SimpleFooterTableViewCell = tableView.dequeueReusableCell(type: SimpleFooterTableViewCell.self)
        let accountsForSection: [Account] = getAccounts(for: section)
        let accountsTotal = accountsForSection.reduce(0.0) { (total, account) -> Double in
            total + account.balance
        }
        footerCell.configureCell(object: accountsTotal)
        return footerCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let simpleSectionCell: SimpleSectionTableViewCell = tableView.dequeueReusableCell(type: SimpleSectionTableViewCell.self)
        
        switch AccountCategories(rawValue: section)! {
        case .deposit:
             simpleSectionCell.configureCell(object: ("Accounts.Type.Deposit".localized, depositAccounts.count))
        case .investments:
            simpleSectionCell.configureCell(object: ("Accounts.Type.Investments".localized, investmentAccounts.count))
        default: break
        }
        
        return simpleSectionCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch AccountCategories(rawValue: section)! {
        case .deposit:
            return depositAccounts.count
        case .investments:
            return investmentAccounts.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var accountsForSection: [Account] = getAccounts(for: indexPath.section)
        
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
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
