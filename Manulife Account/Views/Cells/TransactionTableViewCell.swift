//
//  TransactionTableViewCell.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var transactionTitleLabel: UILabel!
    @IBOutlet weak var transactionAmountLabel: UILabel!
    @IBOutlet weak var accountNetLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TransactionTableViewCell: ConfigurableTableViewCellProtocol {
   
    typealias configurableObject = Activity
    
    func configureCell(object: configurableObject) {
        
        transactionTitleLabel.attributedText = object.description.styled(.greyTitle19pt)
        
        //This is based off the assumption that there can be only two types of transaction activities, withdrawal or deposit.
        transactionAmountLabel.attributedText = object.depositAmount != nil ? object.depositAmount.formatCurrency(of: TransactionType.none).styled(.greyTitle19pt) : object.withdrawalAmount.formatCurrency(of: TransactionType.withdrawal).styled(.greyRight19pt)
        accountNetLabel.attributedText = object.balance.formatCurrency(of: TransactionType.none).styled(.blueRight14pt)
    }
}
