//
//  ListDalilViewCell.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 31/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class ListDalilViewCell: UITableViewCell {

    @IBOutlet weak var sumberDalilLabel: UILabel!
    @IBOutlet weak var bagianLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
