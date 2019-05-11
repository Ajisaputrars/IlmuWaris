//
//  SaudaraKandungViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 3/7/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class SaudaraKandungViewController: UIViewController {
    
    @IBOutlet weak var saudaraKandungLakiTextField: UITextField!
    @IBOutlet weak var saudaraKandungPerempuanTextField: UITextField!
    
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
    
    //Saudara Kandung
    var isSaudaraKandung = false
    
    var isSaudaraKandungLakiAshabah =  false
    var isSaudaraKandungPerempuanAshabah = false
    
    var isSaudaraKandungLaki = false
    var jumlahSaudaraKandungLaki = 0
    
    var isSaudaraKandungPerempuan = false
    var jumlahSaudaraKandungPerempuan = 0

    var isAshabahMaalGhair = false
    
    var jmlSaudaraKandungLaki: Int {
        if saudaraKandungLakiTextField.text == "" {
            return 0
        }
        return Int(saudaraKandungLakiTextField.text!)!
    }
    
    var jmlSaudaraKandungPerempuan: Int {
        if saudaraKandungPerempuanTextField.text == "" {
            return 0
        }
        return Int(saudaraKandungPerempuanTextField.text!)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //printCheck()
    }
    
    @IBAction func buttonNextPressed(_ sender: ButtonCustomClass) {
        setAll()
        
        if (isAshabah == true) {
            performSegue(withIdentifier: "skipSaudaraSeayahFromSaudaraKandung", sender: nil)
        }
        else if isAshabah == false {
            performSegue(withIdentifier: "toSaudaraSeayahFromSaudaraKandung", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SaudaraSeayahViewController {
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
            
            //Saudara Kandung
            
            destination.isSaudaraKandung = self.isSaudaraKandung
            destination.isSaudaraKandungLakiAshabah = self.isSaudaraKandungLakiAshabah
            destination.isSaudaraKandungPerempuanAshabah = self.isSaudaraKandungPerempuanAshabah
            destination.isSaudaraKandungLaki = self.isSaudaraKandungLaki
            destination.jumlahSaudaraKandungLaki = self.jumlahSaudaraKandungLaki
            destination.isSaudaraKandungPerempuan = self.isSaudaraKandungPerempuan
            destination.jumlahSaudaraKandungPerempuan = self.jumlahSaudaraKandungPerempuan
            destination.isAshabahMaalGhair = self.isAshabahMaalGhair
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
        
        if let destination = segue.destination as? SkipSaudaraSeayahViewController {
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
            
            //Saudara Kandung
            
            destination.isSaudaraKandung = self.isSaudaraKandung
            destination.isSaudaraKandungLakiAshabah = self.isSaudaraKandungLakiAshabah
            destination.isSaudaraKandungPerempuanAshabah = self.isSaudaraKandungPerempuanAshabah
            destination.isSaudaraKandungLaki = self.isSaudaraKandungLaki
            destination.jumlahSaudaraKandungLaki = self.jumlahSaudaraKandungLaki
            destination.isSaudaraKandungPerempuan = self.isSaudaraKandungPerempuan
            destination.jumlahSaudaraKandungPerempuan = self.jumlahSaudaraKandungPerempuan
            destination.isAshabahMaalGhair = self.isAshabahMaalGhair
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
    }
    
    func setAll(){
        
        setAbstractionLocalVeriables()
        checkAshabahSaudaraKandungLaki()
        checkAshabahMaalGhair()

//        print("")
//        print("Saudara kandung laki ada? = \(isSaudaraKandungLaki)")
//        print("Jumlah saudara kandung laki? = \(jumlahSaudaraKandungLaki)")
//        print("Saudara kandung perempuan ada? = \(isSaudaraKandungPerempuan)")
//        print("Jumlah saudara kandung perempuan? = \(jumlahSaudaraKandungPerempuan)")
//        
//        print("Ashabah sudah ada? \(isAshabah)")
//        print("Saudara laki ashabah? = \(isSaudaraKandungLakiAshabah)")
//        print("Saudara perempuan ashabah? = \(isSaudaraKandungPerempuanAshabah)")
//        print("Ashabah maal ghair benar? = \(isAshabahMaalGhair)")
    }
    
    func checkAshabahMaalGhair(){
        
        if isSaudaraKandungPerempuan == true {
            if isAshabah == false {
                if isAnakPerempuan == true {
                    isAshabahMaalGhair = true
                    isSaudaraKandungPerempuanAshabah = true
                    isAshabah = true
                } else if isAnakPerempuan == false {
                    if isCucuPerempuan == true {
                        isAshabahMaalGhair = true
                        isSaudaraKandungPerempuanAshabah = true
                        isAshabah = true
                    } else if isCucuPerempuan == false {
                        isAshabahMaalGhair = false
                        isSaudaraKandungPerempuanAshabah = false
                        isAshabah = false
                    }
                }
            }
        } else {
            isAshabahMaalGhair = false
            isSaudaraKandungPerempuanAshabah = false
        }
    }
    
    func checkAshabahSaudaraKandungLaki(){
        
        if isSaudaraKandungLaki == true {
            isSaudaraKandungLakiAshabah = true
            isAshabah = true
        } else if isSaudaraKandungLaki == false {
            isSaudaraKandungLakiAshabah = false
            isAshabah = false
        }
    }
    
    func setAbstractionLocalVeriables(){
        jumlahSaudaraKandungLaki = jmlSaudaraKandungLaki
        jumlahSaudaraKandungPerempuan = jmlSaudaraKandungPerempuan
        
        let jumlahSaudaraKandung = jumlahSaudaraKandungLaki + jumlahSaudaraKandungPerempuan
        if jumlahSaudaraKandung > 0 {
            isSaudaraKandung = true
        } else {
            isSaudaraKandung = false
        }
        
        if jumlahSaudaraKandungLaki > 0 {
            isSaudaraKandungLaki = true
        } else if jumlahSaudaraKandungLaki <= 0 {
            isSaudaraKandungLaki = false
        }
        
        if jumlahSaudaraKandungPerempuan > 0 {
            isSaudaraKandungPerempuan = true
        } else if jumlahSaudaraKandungPerempuan <= 0 {
            isSaudaraKandungPerempuan = false
        }
    }
    
    
    func printCheck(){
        print ("")
        print ("Berikut ini adalah jumlah semua keluarga dari Saudara View Controller")
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
