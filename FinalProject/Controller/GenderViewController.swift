//
//  GenderViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 2/14/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit
import KGRadioButton

class GenderViewController: UIViewController, BEMCheckBoxDelegate {
   
    @IBOutlet weak var priaRadioButton: BEMCheckBox!
    @IBOutlet weak var wanitaRadioButton: BEMCheckBox!
    @IBOutlet weak var warningLabel: UILabel!
    
    var hartaKotor = 0.0
    var pengurusanJenazah = 0.0
    var hutang = 0.0
    var wasiat = 0.0
    var hartaSiapBagi = 0.0
    var gender = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priaRadioButton.delegate = self
        wanitaRadioButton.delegate = self
        
        warningLabel.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SuamiViewController {
            destination.gender = self.gender
            destination.hartaSiapBagi = self.hartaSiapBagi
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
        if let destination = segue.destination as? IstriViewController {
            destination.gender = self.gender
            destination.hartaSiapBagi = self.hartaSiapBagi
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
    }
    
    func didTap(_ checkBox: BEMCheckBox) {
        warningLabel.isHidden = true

        if checkBox.tag == 1 {
            gender = "P"
            wanitaRadioButton.on = false
        }
            
        else if checkBox.tag == 2 {
            gender = "W"
            priaRadioButton.on = false
        }
    }
    
    @IBAction func buttonNextPressed(_ sender: Any) {
        if priaRadioButton.on == true {
            performSegue(withIdentifier: "suamiSegue", sender: nil)
        }
        
        else if wanitaRadioButton.on == true{
            performSegue(withIdentifier: "istriSegue", sender: nil)
        }
        else {
            warningLabel.isHidden = false
        }
    }
}
