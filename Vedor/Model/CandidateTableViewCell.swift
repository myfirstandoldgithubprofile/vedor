//
//  CandidateTableViewCell.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/12/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit

class CandidateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var partyFlagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberInitialsLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
