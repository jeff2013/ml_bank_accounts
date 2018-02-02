//
//  AccountTableViewCell.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var accountIDLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension AccountTableViewCell: ConfigurableTableViewCellProtocol {
    typealias configurableObject = Account
    
    func configureCell(object: Account) {
        accountNameLabel.attributedText = object.displayName.localized.styled(.cellTitle)
        accountIDLabel.attributedText = String(object.id).styled(.cellSubtitle)
        accountBalanceLabel.attributedText = object.balance > 0 ? "$\(String(object.balance))".styled(.balanceTitlePositive) : "$\(String(object.balance))".styled(.balanceTitleNegative)
    }
}
