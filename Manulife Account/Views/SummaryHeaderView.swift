//
//  SummaryHeaderView.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-02.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit

class SummaryHeaderView: UIView {
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SummaryHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        contentView.layer.shadowRadius = 1
    }
}

extension SummaryHeaderView: ConfigurableTableViewCellProtocol {
    
    typealias configurableObject = NSAttributedString
    
    func configureCell(object: configurableObject) {
        headerTitleLabel.attributedText = "Account.Detail.Balance.Title".localized.styled(.greyMiddle14pt)
        balanceLabel.attributedText = object
    }
}
