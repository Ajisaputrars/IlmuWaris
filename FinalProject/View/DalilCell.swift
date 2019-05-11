//
//  DalilCell.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 7/4/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class DalilCell: UITableViewCell {

    @IBOutlet weak var namaDalilLabel: UILabel!
    @IBOutlet weak var isiDalilLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(dalil: Dalil){
        namaDalilLabel.text = dalil.sumberDalil
        isiDalilLabel.text = dalil.isiDalil
    }
    
    func configure(test: Int){
        namaDalilLabel.text = "Q.S An-Nisa’ : \(test)"
        isiDalilLabel.text = "Ini adalah salah satu contoh isi dalil untuk nomor \(test) dan seterusnya"
    }
}
