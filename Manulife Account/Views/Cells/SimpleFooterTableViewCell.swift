//
//  SimpleFooterTableViewCell.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit

class SimpleFooterTableViewCell: UITableViewCell {

    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SimpleFooterTableViewCell: ConfigurableTableViewCellProtocol {
    
    typealias configurableObject = Double
    
    func configureCell(object: configurableObject) {
        totalTitleLabel.attributedText = "Accounts.Total".localized.styled(.cellTitle)
        totalAmountLabel.attributedText = object.formatCurrency().styled(.greyTitle19pt)
    }
}
