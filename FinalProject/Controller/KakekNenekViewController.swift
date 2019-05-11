//
//  KakekNenekViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 2/27/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class KakekNenekViewController: UIViewController {
    
    @IBOutlet weak var aTextField2: UITextField!
    @IBOutlet weak var aTextField3: UITextField!
    @IBOutlet weak var kakekRadioButton: BEMCheckBox!
    @IBOutlet weak var nenekDariAyahLabel: UILabel!
    @IBOutlet weak var nenekDariIbuLabel: UILabel!
    @IBOutlet weak var nenekDariAyahSliderOutlet: UISlider!
    @IBOutlet weak var nenekDariIbuSliderOutlet: UISlider!
    @IBOutlet weak var skipKakekLabel: UILabel!
    @IBOutlet weak var skipNenekDariIbuLabel: UILabel!
    @IBOutlet weak var skipNenekDariAyahLabel: UILabel!
    
    //Harta dan Gender
    var hartaKotor = 0.0
    var pengurusanJenazah = 0.0
    var hutang = 0.0
    var wasiat = 0.0
    var hartaSiapBagi = 0.0
    var gender = ""
    
    //Cek Ashabah
    var isAshabah = false
    var isAyahAshabah = false
    var isAnakLakiAshabah = false
    var isCucuLakiAshabah = false
    var isKakekAshabah = false
    
    //Pasangan
    var isPasangan = false
    var jumlahPasangan = 0
    
    //Ayah dan Ibu
    var isAyah = false
    var isIbu = false
    
    //Anak
    var isAnak = false
    
    var isAnakLaki = false
    var jumlahAnakLaki = 0
    
    var isAnakPerempuan = false
    var jumlahAnakPerempuan = 0
    
    //Cucu
    var isCucu = false
    
    var isCucuLaki = false
    var jumlahCucuLaki = 0
    
    var isCucuPerempuan = false
    var jumlahCucuPerempuan = 0
    
    //Kakek Nenek
    var isKakek = false
    var isNenekDariIbu = false
    var isNenekDariAyah =  false

    var jumlahNenekDariIbu = 0
    var jumlahNenekDariAyah = 0
    
    var jmlNenekDariIbu: Int {
        if nenekDariIbuLabel.text == "" {
            return 0
        }
        return Int(nenekDariIbuLabel.text!)!
    }
    
    var jmlNenekDariAyah: Int {
        if nenekDariAyahLabel.text == "" {
            return 0
        }
        return Int(nenekDariAyahLabel.text!)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nenekDariAyahSliderOutlet.value = 0.0
        nenekDariIbuSliderOutlet.value = 0.0
        skipKakekLabel.isHidden = true
        skipNenekDariAyahLabel.isHidden = true
        skipNenekDariIbuLabel.isHidden = true
        aTextField2.isEnabled = false
        aTextField3.isEnabled = false
        
        if isAyah{
            skipNenekDariAyahLabel.text = "Dilewati karena ada Ayah"
        } else if isIbu {
            skipNenekDariAyahLabel.text = "Dilewati karena ada Ibu"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //printCheck()
        checkConditionForKakekNenek()
    }
    
    @IBAction func nenekDariAyahSlider(_ sender: UISlider) {
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
        
        jumlahNenekDariAyah = senderValue
        
        if jumlahNenekDariAyah > 0 {
            isNenekDariAyah = true
        }
        else if jumlahNenekDariAyah <= 0 {
            isNenekDariAyah = false
        }
        
        nenekDariAyahLabel.text = String(senderValue)
    }
    @IBAction func nenekDariIbuSlider(_ sender: UISlider) {
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
        
        jumlahNenekDariIbu = senderValue
        
        if jumlahNenekDariIbu > 0 {
            isNenekDariIbu = true
        }
        else if jumlahNenekDariIbu <= 0 {
            isNenekDariIbu = false
        }
        
        nenekDariIbuLabel.text = String(senderValue)
    }
    @IBAction func buttonNextPressed(_ sender: Any) {
        checkKakekAshabah()
        
        //printCheck()
        if (isAshabah == true) {
            performSegue(withIdentifier: "toSkipSaudaraKandungFromKakekNenek", sender: nil)
        }
        else if isAshabah == false {
            performSegue(withIdentifier: "toSaudaraKandungFromKakekNenek", sender: nil)
        }
    }
    
    func checkConditionForKakekNenek(){
        if isAyah == false {
            if isIbu == true {
                skipNenekDariIbuLabel.isHidden = false
                skipNenekDariAyahLabel.isHidden = false
                nenekDariIbuSliderOutlet.isEnabled = false
                nenekDariAyahSliderOutlet.isEnabled = false
            }
            else if isIbu == false {
                nenekDariIbuSliderOutlet.isEnabled = true
                nenekDariAyahSliderOutlet.isEnabled = true
            }
        } else if isAyah == true {
            if isIbu == true {
                
            }
            else if isIbu == false {
                kakekRadioButton.isEnabled = false
                skipKakekLabel.isHidden = false
                skipNenekDariAyahLabel.isHidden = false
                nenekDariAyahSliderOutlet.isEnabled = false
            }
        }
    }
    
    func checkKakekAshabah(){
        isKakekAshabah = false
        
        if isAshabah{
            if(isAyahAshabah || isAnakLakiAshabah || isCucuLakiAshabah){
                isAshabah = true
            }
            else {
                isAshabah = false
            }
        }
        

        if kakekRadioButton.on == true {
            isKakek = true
            if isAshabah == false {
                isKakekAshabah = true
            }
            
        } else if kakekRadioButton.on == false {
            isKakek = false
            isKakekAshabah = false
        }
        
        if isKakekAshabah {
            if isAshabah == false {
                isAshabah = true
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SaudaraKandungViewController {
            //Harta dan gender
            destination.hartaSiapBagi = self.hartaSiapBagi
            destination.gender =  self.gender
            
            //Ashabah
            destination.isAshabah = self.isAshabah
            destination.isAyahAshabah = self.isAyahAshabah
            destination.isAnakLakiAshabah = self.isAnakLakiAshabah
            destination.isCucuLakiAshabah = self.isCucuLakiAshabah
            destination.isKakekAshabah = self.isKakekAshabah
            
            //Pasangan
            destination.isPasangan = self.isPasangan
            destination.jumlahPasangan = self.jumlahPasangan
            
            //Ayah Ibu
            destination.isAyah = self.isAyah
            destination.isIbu = self.isIbu
            
            //Anak
            destination.isAnak = self.isAnak
            destination.isAnakLaki = self.isAnakLaki
            destination.jumlahAnakLaki = self.jumlahAnakLaki
            destination.isAnakPerempuan = self.isAnakPerempuan
            destination.jumlahAnakPerempuan = self.jumlahAnakPerempuan
            
            //Cucu
            destination.isCucu = self.isCucu
            destination.isCucuLaki = self.isCucuLaki
            destination.jumlahCucuLaki = self.jumlahCucuLaki
            destination.isCucuPerempuan = self.isCucuPerempuan
            destination.jumlahCucuPerempuan = self.jumlahCucuPerempuan
            
            //Kakek Nenek
            destination.isKakek = self.isKakek
            destination.isNenekDariAyah = self.isNenekDariAyah
            destination.isNenekDariIbu = self.isNenekDariIbu
            destination.jumlahNenekDariAyah = self.jumlahNenekDariAyah
            destination.jumlahNenekDariIbu = self.jumlahNenekDariIbu
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
        
        if let destination = segue.destination as? SkipSaudaraKandungViewController {
            //Harta dan gender
            destination.hartaSiapBagi = self.hartaSiapBagi
            destination.gender =  self.gender
            
            //Ashabah
            destination.isAshabah = self.isAshabah
            destination.isAyahAshabah = self.isAyahAshabah
            destination.isAnakLakiAshabah = self.isAnakLakiAshabah
            destination.isCucuLakiAshabah = self.isCucuLakiAshabah
            destination.isKakekAshabah = self.isKakekAshabah
            
            //Pasangan
            destination.isPasangan = self.isPasangan
            destination.jumlahPasangan = self.jumlahPasangan
            
            //Ayah Ibu
            destination.isAyah = self.isAyah
            destination.isIbu = self.isIbu
            
            //Anak
            destination.isAnak = self.isAnak
            destination.isAnakLaki = self.isAnakLaki
            destination.jumlahAnakLaki = self.jumlahAnakLaki
            destination.isAnakPerempuan = self.isAnakPerempuan
            destination.jumlahAnakPerempuan = self.jumlahAnakPerempuan
            
            //Cucu
            destination.isCucu = self.isCucu
            destination.isCucuLaki = self.isCucuLaki
            destination.jumlahCucuLaki = self.jumlahCucuLaki
            destination.isCucuPerempuan = self.isCucuPerempuan
            destination.jumlahCucuPerempuan = self.jumlahCucuPerempuan
            
            //Kakek Nenek
            destination.isKakek = self.isKakek
            destination.isNenekDariAyah = self.isNenekDariAyah
            destination.isNenekDariIbu = self.isNenekDariIbu
            destination.jumlahNenekDariAyah = self.jumlahNenekDariAyah
            destination.jumlahNenekDariIbu = self.jumlahNenekDariIbu
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
    }
    func printCheck(){
        print ("")
        print ("Berikut ini adalah jumlah semua keluarga dari Kakek View Controller")
        print ("")
        print ("GENDER adalah = \(gender)")
        print ("Harta siap bagi adalah = \(hartaSiapBagi)")
        print ("")
        print ("Cek Ashabah")
        print ("")
        print ("Apakah sudah ada Ashabah = \(isAshabah)")
        print ("Apakah Ayah Ashabah?  = \(isAyahAshabah)")
        print ("Apakah Anak laki2 Ashabah?  = \(isAnakLakiAshabah)")
        print ("Apakah Cucu laki2 Ashabah?  = \(isCucuLakiAshabah)")
        print ("Apakah Kakek Ashabah?  = \(isKakekAshabah)")
        print ("")
        print ("Cek Pasangan")
        print ("")
        print ("Apakah ada pasangan?  = \(isPasangan)")
        print ("Jumlah pasangan = \(jumlahPasangan)")
        print ("")
        print ("Cek Ayah dan Ibu")
        print ("")
        print ("Ayah ada?  = \(isAyah)")
        print ("Ibu ada? = \(isIbu)")
        print ("")
        print ("Cek Anak")
        print ("")
        print ("Anak ada?  = \(isAnak)")
        print ("Jumlah Anak Laki-laki adalah = \(jumlahAnakLaki)")
        print ("Jumlah Anak Perempuan adalah = \(jumlahAnakPerempuan)")
        print ("")
        print ("Cek Cucu")
        print ("")
        print ("Apakah ada cucu? = \(isCucu)")
        print ("Jumlah cucu laki adalah = \(jumlahCucuLaki)")
        print ("Jumlah cucu Perempuan adalah = \(jumlahCucuPerempuan)")
        print ("")
        print ("Apakah ada kakek? = \(isKakek)")
        print ("Apakah ada nenek dari ayah? = \(isNenekDariAyah)")
        print ("Jumlah nenek dari ayah  adalah = \(jumlahNenekDariAyah)")
        print ("Apakah ada nenek dari ibu? = \(isNenekDariIbu)")
        print ("Jumlah nenek dari ibu adalah   = \(jumlahNenekDariIbu)")
    }
}
