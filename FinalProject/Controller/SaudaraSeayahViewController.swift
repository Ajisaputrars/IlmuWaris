//
//  SaudaraSeayahViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 3/7/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class SaudaraSeayahViewController: UIViewController {
    @IBOutlet weak var saudaraLakiSeayahTextField: UITextField!
    @IBOutlet weak var saudaraPerempuanSeayahTextField: UITextField!
    @IBOutlet weak var skipSaudaraPerempuanLabel: UILabel!
    
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
    
    var isAshabahMaalGhair = false
    
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
    
    
    //Saudara Seayah
    var isSaudaraSeayah = false
    
    var isSaudaraSeayahLakiAshabah =  false
    var isSaudaraSeayahPerempuanAshabah = false
    
    var isSaudaraSeayahLaki = false
    var jumlahSaudaraSeayahLaki = 0
    
    var isSaudaraSeayahPerempuan = false
    var jumlahSaudaraSeayahPerempuan = 0
    
    var jmlSaudaraLakiSeayah: Int {
        if saudaraLakiSeayahTextField.text == "" {
            return 0
        }
        return Int(saudaraLakiSeayahTextField.text!)!
    }
    
    var jmlSaudaraPerempuanSeayah: Int {
        if saudaraPerempuanSeayahTextField.text == "" {
            return 0
        }
        return Int(saudaraPerempuanSeayahTextField.text!)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saudaraLakiSeayahTextField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
        
        skipSaudaraPerempuanLabel.isHidden = true
        if jumlahSaudaraKandungPerempuan > 1 {
            skipSaudaraPerempuanLabel.isHidden = false
            saudaraPerempuanSeayahTextField.isEnabled = false
        }
        
    }
    @IBAction func buttonNextPressed(_ sender: Any) {
        setAll()
        
        if (isAyah || isKakek || isAnak || isCucu){
            performSegue(withIdentifier: "toSkipSaudaraSeibuFromSaudaraSeayah", sender: nil)
        } else {
            performSegue(withIdentifier: "toSaudaraSeibuFromSaudaraSeayah", sender: nil)
        }
    }
    
    func setAll(){
        setAbstractionLocalVeriables()
        checkAshabahSaudaraKandungLaki()
        checkAshabahMaalGhair()
        
//        print("")
//        print("Saudara Seayah laki ada? = \(isSaudaraSeayahLaki)")
//        print("Jumlah saudara Seayah laki? = \(jumlahSaudaraSeayahLaki)")
//        print("Saudara Seayah perempuan ada? = \(isSaudaraSeayahPerempuan)")
//        print("Jumlah saudara Seayah perempuan? = \(jumlahSaudaraSeayahPerempuan)")
//        
//        print("Ashabah sudah ada? \(isAshabah)")
//        print("Saudara laki Seayah ashabah? = \(isSaudaraSeayahLakiAshabah)")
//        print("Saudara perempuan Seayah ashabah? = \(isSaudaraSeayahPerempuanAshabah)")
//        print("Ashabah maal ghair benar? = \(isAshabahMaalGhair)")
    }
    
    func setAbstractionLocalVeriables(){
        jumlahSaudaraSeayahLaki = jmlSaudaraLakiSeayah
        jumlahSaudaraSeayahPerempuan = jmlSaudaraPerempuanSeayah
        
        let jumlahSaudaraSeayah = jumlahSaudaraSeayahLaki + jumlahSaudaraSeayahPerempuan
        if jumlahSaudaraSeayah > 0 {
            isSaudaraSeayah = true
        } else {
            isSaudaraSeayah = false
        }
        
        if jumlahSaudaraSeayahLaki > 0 {
            isSaudaraSeayahLaki = true
        } else if jumlahSaudaraSeayahLaki <= 0 {
            isSaudaraSeayahLaki = false
        }
        
        if jumlahSaudaraSeayahPerempuan > 0 {
            isSaudaraSeayahPerempuan = true
        } else if jumlahSaudaraSeayahPerempuan <= 0 {
            isSaudaraSeayahPerempuan = false
        }
    }
    
    func checkAshabahSaudaraKandungLaki(){
        if isSaudaraSeayahLaki == true {
            isSaudaraSeayahLakiAshabah = true
            isAshabah = true
        } else if isSaudaraSeayahLaki == false {
            isSaudaraSeayahLakiAshabah = false
            isAshabah = false
        }
    }
    
    func checkAshabahMaalGhair(){

        if isSaudaraSeayahPerempuan == true {
            if isAshabah == false {
                if isAnakPerempuan == true {
                    isAshabahMaalGhair = true
                    isSaudaraSeayahPerempuanAshabah = true
                    isAshabah = true
                } else if isAnakPerempuan == false {
                    if isCucuPerempuan == true {
                        isAshabahMaalGhair = true
                        isSaudaraSeayahPerempuanAshabah = true
                        isAshabah = true
                    } else if isCucuPerempuan == false {
                        isAshabahMaalGhair = false
                        isSaudaraSeayahPerempuanAshabah = false
                        isAshabah = false
                    }
                }
            }
        } else {
            isAshabahMaalGhair = false
            isSaudaraSeayahPerempuanAshabah = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SaudaraSeibuViewController {
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
            
            //Saudara Seayah
            destination.isSaudaraSeayah = self.isSaudaraSeayah
            destination.isSaudaraSeayahLakiAshabah = self.isSaudaraSeayahLakiAshabah
            destination.isSaudaraSeayahPerempuanAshabah = self.isSaudaraSeayahPerempuanAshabah
            destination.isSaudaraSeayahLaki = self.isSaudaraSeayahLaki
            destination.jumlahSaudaraSeayahLaki = self.jumlahSaudaraSeayahLaki
            destination.isSaudaraSeayahPerempuan = self.isSaudaraSeayahPerempuan
            destination.jumlahSaudaraSeayahPerempuan = self.jumlahSaudaraSeayahPerempuan
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
        
        if let destination = segue.destination as? SkipSaudaraSeibuViewController {
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
            
            //Saudara Seayah
            destination.isSaudaraSeayah = self.isSaudaraSeayah
            destination.isSaudaraSeayahLakiAshabah = self.isSaudaraSeayahLakiAshabah
            destination.isSaudaraSeayahPerempuanAshabah = self.isSaudaraSeayahPerempuanAshabah
            destination.isSaudaraSeayahLaki = self.isSaudaraSeayahLaki
            destination.jumlahSaudaraSeayahLaki = self.jumlahSaudaraSeayahLaki
            destination.isSaudaraSeayahPerempuan = self.isSaudaraSeayahPerempuan
            destination.jumlahSaudaraSeayahPerempuan = self.jumlahSaudaraSeayahPerempuan
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
    }
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        let jumlahSaudaraLakilakiSeayah =  Int(textField.text!) ?? 0
        if jumlahSaudaraKandungPerempuan > 1 {
            if jumlahSaudaraLakilakiSeayah >= 1 {
                skipSaudaraPerempuanLabel.isHidden = true
                saudaraPerempuanSeayahTextField.isEnabled = true
            } else {
                skipSaudaraPerempuanLabel.isHidden = false
                saudaraPerempuanSeayahTextField.isEnabled = false
                saudaraPerempuanSeayahTextField.text = ""
            }
        }
    }
}
