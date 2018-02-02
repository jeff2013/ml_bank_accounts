//
//  SimpleTitleTableViewCell.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit

class SimpleTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SimpleTitleTableViewCell: ConfigurableTableViewCellProtocol {
    
    typealias configurableObject = String
    
    func configureCell(object: configurableObject) {
        titleLabel.attributedText = object.styled(.greyLeftBold18)
    }
}
