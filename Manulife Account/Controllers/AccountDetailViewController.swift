//
//  AccountDetailViewController.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit
import SVProgressHUD

class AccountDetailViewController: UIViewController {

    var account: Account!
    var transactions: [Transaction] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setupTableView()
    }
    
    func setupView() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            if let account = account {
                navigationController?.setTitle(title: account.displayName)
                title = account.displayName
            }
            navigationController?.navigationBar.largeTitleTextAttributes =
                [NSAttributedStringKey.font: UIFont(.helveticaNeueMedium, size: 30),
                NSAttributedStringKey.foregroundColor: UIColor(.azureBlue)]
        } else {
            // Fallback on earlier versions
        }
        
        SVProgressHUD.show()
        BankService.retrieveTransactions(for: AccountTypes(rawValue: account.id)!) { (response) in
            SVProgressHUD.dismiss()
            if response.error == nil {
                self.transactions = response.result.value!
                self.tableView.reloadData()
            } else {
                SVProgressHUD.showError(withStatus: "TEMP ERROR MESSAGE")
            }
        }
    }
    
    func setupTableView() {
        tableView.registerCellTypes(types: [TransactionTableViewCell.self, SimpleTitleTableViewCell.self])
        tableView.estimatedRowHeight = 200
        tableView.estimatedSectionHeaderHeight = 200
        tableView.tableFooterView = UIView()
    }
}

extension AccountDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AccountDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let simpleHeaderCell: SimpleTitleTableViewCell = tableView.dequeueReusableCell(type: SimpleTitleTableViewCell.self)
        if let date = DateFormatter.getFormatter(with: .hashes).date(from: transactions[section].date) {
            simpleHeaderCell.configureCell(object: DateFormatter.getFormatter(with: .regular).string(from: date))
        }
        return simpleHeaderCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions[section].activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transactionCell: TransactionTableViewCell = tableView.dequeueReusableCell(type: TransactionTableViewCell.self)
        transactionCell.configureCell(object: transactions[indexPath.section].activities[indexPath.row])
        return transactionCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}
