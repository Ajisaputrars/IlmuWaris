//
//  AhliWarisCell.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 4/27/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class AhliWarisCell: UITableViewCell {

    @IBOutlet weak var namaAhliWarisLabel: UILabel!
    @IBOutlet weak var bagianAhliWarisLabel: UILabel!
    @IBOutlet weak var hartaAhliWarisLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(ahliWaris x: AhliWaris){
        self.namaAhliWarisLabel.text = x.displayName
        self.bagianAhliWarisLabel.text = "\(x.bagianWarisan)"
        
        if x.bagianWarisan == "Ashabah" {
            bagianAhliWarisLabel.font = bagianAhliWarisLabel.font.withSize(9)
        }
        
        if x.ashabahAyahWithIbu == true {
            self.bagianAhliWarisLabel.text = "\(x.bagianWarisan)+A"
        }
        
        let h = Double(x.harta)
        if h <= 0 {
            self.hartaAhliWarisLabel.text = "Sudah Habis"
            self.hartaAhliWarisLabel.textColor = UIColor.red
            
        } else {
            let a = String((x.harta)/Double(x.jumlahTotalBersekutu))
            self.hartaAhliWarisLabel.text = a.toRupiahCurrency
        }

        bagianAhliWarisLabel.layer.addBorder(edge: .left, color: UIColor.black, thickness: 1)
        bagianAhliWarisLabel.layer.addBorder(edge: .right, color: UIColor.black, thickness: 1)
        print("Cell dengan nama \(namaAhliWarisLabel.text!) memiliki tinggi \(namaAhliWarisLabel.bounds.size.height)")
    }
}
