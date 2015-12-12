//
//  StateTableViewCell.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/12/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit

class StateTableViewCell: UITableViewCell {

    @IBOutlet weak var flagImageView: UIImageView!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
