//
//  IlmuWarisViewCell.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 16/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class IlmuWarisViewCell: UITableViewCell {
    @IBOutlet weak var ilmuWarisImageView: UIImageView!
    @IBOutlet weak var ilmuWarisDescriptionLabel: UILabel!
    @IBOutlet weak var ilmuWarisTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
