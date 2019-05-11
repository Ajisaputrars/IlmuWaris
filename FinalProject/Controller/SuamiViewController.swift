//
//  SuamiViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 2/20/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class SuamiViewController: UIViewController {
    
    @IBOutlet weak var aTextField1: UITextField!
    @IBOutlet weak var ayahRadioButton: BEMCheckBox!
    @IBOutlet weak var ibuRadioButton: BEMCheckBox!
    @IBOutlet weak var istriSlider: UISlider!
    @IBOutlet weak var anakLakiTextField: UITextField!
    @IBOutlet weak var anakPerempuanTextField: UITextField!
    @IBOutlet weak var jumlahIstriLabel: UILabel!
    
    var hartaKotor = 0.0
    var pengurusanJenazah = 0.0
    var hutang = 0.0
    var wasiat = 0.0
    var hartaSiapBagi = 0.0
    var gender = ""
    
    var isAshabah = false
    var isAyahAshabah = false
    var isAnakLakiAshabah = false
    
    var isPasangan = false
    var jumlahPasangan = 0
    
    var isAyah = false
    var isIbu = false
    
    var isAnak = false
    
    var isAnakLaki = false
    var jumlahAnakLaki = 0
    
    var isAnakPerempuan = false
    var jumlahAnakPerempuan = 0
    
    private var jmlAnakLaki: Int {
        if anakLakiTextField.text == "" {
            return 0
        }
        return Int(anakLakiTextField.text!)!
    }
    
    private var jmlAnakPerempuan: Int {
        if anakPerempuanTextField.text == "" {
            return 0
        }
        return Int(anakPerempuanTextField.text!)!
    }
    
    private var isAyahAda: Bool {
        
        if ayahRadioButton.on == true {
            return true
        }
        else {
            return false
        }
    }
    
    private var isIbuAda: Bool {
        
        if ibuRadioButton.on == true {
            return true
        }
        else {
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        istriSlider.value = 0.0
        aTextField1.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CucuViewController {
            destination.hartaSiapBagi = self.hartaSiapBagi
            destination.gender =  self.gender
            destination.isAshabah = self.isAshabah
            destination.isAyahAshabah = self.isAyahAshabah
            destination.isAnakLakiAshabah = self.isAnakLakiAshabah
            destination.isPasangan = self.isPasangan
            destination.jumlahPasangan = self.jumlahPasangan
            destination.isAyah = self.isAyah
            destination.isIbu = self.isIbu
            destination.isAnak = self.isAnak
            destination.isAnakLaki = self.isAnakLaki
            destination.jumlahAnakLaki = self.jumlahAnakLaki
            destination.isAnakPerempuan = self.isAnakPerempuan
            destination.jumlahAnakPerempuan = self.jumlahAnakPerempuan
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
        
        if let destination = segue.destination as? SkipCucuViewController {
            destination.hartaSiapBagi = self.hartaSiapBagi
            destination.gender =  self.gender
            destination.isAshabah = self.isAshabah
            destination.isAyahAshabah = self.isAyahAshabah
            destination.isAnakLakiAshabah = self.isAnakLakiAshabah
            destination.isPasangan = self.isPasangan
            destination.jumlahPasangan = self.jumlahPasangan
            destination.isAyah = self.isAyah
            destination.isIbu = self.isIbu
            destination.isAnak = self.isAnak
            destination.isAnakLaki = self.isAnakLaki
            destination.jumlahAnakLaki = self.jumlahAnakLaki
            destination.isAnakPerempuan = self.isAnakPerempuan
            destination.jumlahAnakPerempuan = self.jumlahAnakPerempuan
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
    }
    
    
    @IBAction func istriSlider(_ sender: UISlider) {
        
        var senderValue = 0
        
        if sender.value <= 0.25 {
            senderValue = 0
        }
        else if sender.value <= 0.5 {
            senderValue = 1
        }
        else if sender.value <= 0.75 {
            senderValue = 2
        }
        else if sender.value < 1{
            senderValue = 3
        }
        else if sender.value == 1.0 {
            senderValue = 4
        }
        
        jumlahPasangan = senderValue
        
        if jumlahPasangan > 0 {
            isPasangan = true
        }
        else if jumlahPasangan <= 0 {
            isPasangan = false
        }
        
        jumlahIstriLabel.text = String(jumlahPasangan)
    }
    
    @IBAction func buttonNextPressed(_ sender: Any) {
        
        setAbstractionLocalVeriable()
        checkAnakLakiDanPerempuan()
        checkAnak()
        checkAshabah()

        if jmlAnakLaki > 0{
            performSegue(withIdentifier: "skipCucuFromSuami", sender: nil)
        }
        else {
            performSegue(withIdentifier: "toCucuFromSuami", sender: nil)
        }
    }
    
    func setAbstractionLocalVeriable(){
        isAyah = isAyahAda
        isIbu = isIbuAda
        jumlahAnakLaki = jmlAnakLaki
        jumlahAnakPerempuan = jmlAnakPerempuan
    }
    
    func checkAnakLakiDanPerempuan(){
        if jumlahAnakLaki <= 0 {
            isAnakLaki = false
        } else {
            isAnakLaki = true
        }
        
        if jumlahAnakPerempuan <= 0 {
            isAnakPerempuan = false
        } else {
            isAnakPerempuan = true
        }
    }
    
    func checkAnak(){
        isAnak = false
        
        if (isAnakLaki || isAnakPerempuan) {
            isAnak = true
        }
    }
    
    func printCheck(){
        print ("")
        print ("Berikut ini adalah jumlah semua keluarga dari Suami View Controller")
        print ("")
        print ("GENDER adalah = \(gender)")
        print ("Harta siap bagi adalah = \(hartaSiapBagi)")
        print ("Pasangan ada?  = \(isPasangan)")
        print ("Jumlah pasangan = \(jumlahPasangan)")
        print ("Anak ada?  = \(isAnak)")
        print ("Jumlah Anak Laki-laki adalah = \(jumlahAnakLaki)")
        print ("Jumlah Anak Perempuan adalah = \(jumlahAnakPerempuan)")
        print ("Ayah ada?  = \(isAyah)")
        print ("Ibu ada? = \(isIbu)")
        print ("")
    }
    
    func checkAshabah(){
        resetAshabah()
        
        if isAyah == true{
            if isAnakLaki == true {
                isAnakLakiAshabah = true
                isAyahAshabah = false
//                isAshabah = true
            } else if isAnakLaki == false {
                isAnakLakiAshabah = false
                isAyahAshabah = true
//                isAshabah = true
            }
            
        //Solusi sementeara
            
        } else if isAyah == false{
            if isAnakLaki == true {
                isAnakLakiAshabah = true
                isAyahAshabah = false
//                isAshabah = true
            } else if isAnakLaki == false {
                isAyahAshabah = false
                isAnakLakiAshabah = false
//                isAshabah = true
            }
        }
        
        if (isAyahAshabah || isAnakLakiAshabah) == true {
            isAshabah = true
        }
    }
    func resetAshabah(){
        isAshabah = false
        isAyahAshabah = false
        isAnakLakiAshabah = false
    }
}
