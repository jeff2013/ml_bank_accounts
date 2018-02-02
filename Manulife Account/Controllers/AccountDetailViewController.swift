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

        setupView()
        retrieveData()
        setupTableView()
    }
    
    func setupView() {
        if let account = account {
            navigationController?.setTitle(title: account.displayName)
            title = account.displayName
        }
    }
    
    /*
     We want to show the transaction information in chronological order since that's what makes the most sense
     Idealy the data returned from the API should be already sorted but this is just in case.
     Side note also idealy each transaction should have some sort of time stamp instead of just the date so that a real order can be maintained
     */
    func retrieveData() {
        SVProgressHUD.show()
        BankService.retrieveTransactions(for: AccountTypes(rawValue: account.id)!) { (response) in
            SVProgressHUD.dismiss()
            if response.error == nil, let value = response.result.value {
                self.transactions = value.sorted(by: { (firstTransaction, secondTransaction) -> Bool in
                    if let date1 = DateFormatter.getFormatter(with: Format.hashes).date(from: firstTransaction.date), let date2 = DateFormatter.getFormatter(with: Format.hashes).date(from: secondTransaction.date) {
                        return date1 > date2
                    } else {
                        // This error case is a bit odd, shouldn't ever get here if the formatter and data is correct
                        // Basically not sorting if the date's don't match up with the formatter
                        return false
                    }
                })
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
        
        let summaryView = SummaryHeaderView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: UIScreen.main.bounds.height * 0.15))
        let balance = account.balance > 0 ? account.balance.formatCurrency(of: .none).styled(.balanceLargePositive) : account.balance.formatCurrency(of: .none).styled(.balanceLargeNegative)
        summaryView.configureCell(object: balance)
        tableView.tableHeaderView = summaryView
        
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
