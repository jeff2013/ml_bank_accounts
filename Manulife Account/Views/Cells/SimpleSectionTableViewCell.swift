//
//  SimpleSectionTableViewCell.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit

class SimpleSectionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var accountsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SimpleSectionTableViewCell: ConfigurableTableViewCellProtocol {
    typealias configurableObject = (String, Int)
    
    func configureCell(object: (String, Int)) {
        titleLabel.attributedText = object.0.styled(.cellTitle)
        accountsLabel.attributedText = "\(object.1) ACCOUNTS".styled(.cellSubtitle)
    }
}
