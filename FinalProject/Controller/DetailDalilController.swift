//
//  DetailDalilController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 31/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class DetailDalilController: UIViewController {
    @IBOutlet weak var namaAhliWarisLabel: UILabel!
    @IBOutlet weak var kadarBagianLabel: UILabel!
    @IBOutlet weak var keteranganLabel: UILabel!
    @IBOutlet weak var sumberDalilTerkaitLabel: UILabel!
    @IBOutlet weak var dalilTerkaitLabel: UILabel!
    @IBOutlet weak var sumberDalilLengkapLabel: UILabel!
    @IBOutlet weak var dalilLengkapLabel: UILabel!
    
    var dalil: Dalil!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setDalilView()
        self.title = "Detail Dalil"
    }
    
    func setDalilView(){
        self.namaAhliWarisLabel.text = dalil.ahliWaris
        self.kadarBagianLabel.text = dalil.bagian
        self.keteranganLabel.text = dalil.syarat?.replacingOccurrences(of: "- ", with: "\n• ", options: .literal, range: nil)
        self.sumberDalilLengkapLabel.text = dalil.sumberDalil
        self.sumberDalilTerkaitLabel.text = dalil.sumberDalil
        self.dalilTerkaitLabel.text = dalil.isiDalil
        var dalilLengkap = ""
        if self.dalil.dalilLengkap == "1" {
            dalilLengkap = dalilCode[0]
        } else if self.dalil.dalilLengkap == "2" {
            dalilLengkap = dalilCode[1]
        } else if self.dalil.dalilLengkap == "3" {
            dalilLengkap = dalilCode[2]
        } else if self.dalil.dalilLengkap == "4" {
            dalilLengkap = dalilCode[3]
        } else if self.dalil.dalilLengkap == "5" {
            dalilLengkap = dalilCode[4]
        } else if self.dalil.dalilLengkap == "6" {
            dalilLengkap = dalilCode[5]
        } else {
            dalilLengkap = "Error"
        }
        self.dalilLengkapLabel.text = dalilLengkap
    }
}
