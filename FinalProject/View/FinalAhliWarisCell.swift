//
//  FinalAhliWarisCell.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 8/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class FinalAhliWarisCell: UITableViewCell {
    @IBOutlet weak var namaAhliWarisLabel: UILabel!
    @IBOutlet weak var bagianLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(ahliWaris: AhliWaris){
        var str = ""
        var rat:Rational!
        
        if ahliWaris.bagianAwal <= 1 {
            rat = ahliWaris.rationalBagianAwal
            str = "\(rat.num)/\(rat.den)"
            
            if ahliWaris.nama == "Ayah" {
                if ahliWaris.isAshabah == true {
                    str += " (A)"
                }
            }
        } else {
            str = "Ashabah"
        }
        
        namaAhliWarisLabel.text = ahliWaris.displayName
        bagianLabel.text = str
    }
}
