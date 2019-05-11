//
//  PamanViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 3/7/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class PamanViewController: UIViewController {
    @IBOutlet weak var pamanKandungTextField: UITextField!
    @IBOutlet weak var pamanSeayahTextField: UITextField!
    
    @IBOutlet weak var skipPamanSeayahLabel: UILabel!
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
    
    //Saudara Seibu
    var isSaudaraSeibu = false
    
    var isSaudaraSeibuLaki = false
    var jumlahSaudaraSeibuLaki = 0
    
    var isSaudaraSeibuPerempuan = false
    var jumlahSaudaraSeibuPerempuan = 0
    
    //Anak Saudara
    var isAnakSaudara = false
    
    var isAnakSaudaraKandungAshabah = false
    var isAnakSaudaraSeayahAshabah = false
    
    var isAnakSaudaraKandung = false
    var jumlahAnakSaudaraKandung = 0
    
    var isAnakSaudaraSeayah = false
    var jumlahAnakSaudaraSeayah = 0
    
    //Paman
    var isPaman = false
    
    var isPamanKandungAshabah = false
    var isPamanSeayahAshabah = false
    
    var isPamanKandung = false
    var jumlahPamanKandung = 0
    
    var isPamanSeayah = false
    var jumlahPamanSeayah = 0
    
    var jmlPamanKandung: Int {
        if pamanKandungTextField.text == "" {
            return 0
        }
        return Int(pamanKandungTextField.text!)!
    }
    
    var jmlPamanSeayah: Int {
        if pamanSeayahTextField.text == "" {
            return 0
        }
        return Int(pamanSeayahTextField.text!)!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skipPamanSeayahLabel.isHidden = true
        pamanKandungTextField.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingChanged)
        
    }
    @IBAction func buttonNextPressed(_ sender: Any) {
        setAbstractionLocalVariables()
        
        if isAshabah {
            performSegue(withIdentifier: "toEndFromPaman", sender: nil)
        } else {
            performSegue(withIdentifier: "toAnakPamanFromPaman", sender: nil)
        }
    }
    
    func setAbstractionLocalVariables(){
        jumlahPamanKandung = jmlPamanKandung
        jumlahPamanSeayah = jmlPamanSeayah
        
        if jumlahPamanKandung > 0 {
            isPamanKandung = true
        } else if jumlahPamanKandung <= 0 {
            isPamanKandung = false
        }
        
        if jumlahPamanSeayah > 0 {
            isPamanSeayah = true
        } else if jumlahPamanSeayah <= 0 {
            isPamanSeayah = false
        }
        
        if isPamanSeayah || isPamanKandung {
            isPaman = true
        } else {
            isPaman = false
        }
        
        checkAshabah()
    }
    
    func checkAshabah(){
        if isPamanKandung == true {
            isPamanKandungAshabah = true
            isAshabah = true
            
        } else if isPamanKandung == false {
            isPamanKandungAshabah = false
            isAshabah = false
            
            if isPamanSeayah == true {
                isPamanSeayahAshabah = true
                isAshabah = true
            } else if isPamanSeayah == false {
                isPamanSeayahAshabah = false
                isAshabah = false
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EndMeasureViewController {
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
            
            //Saudara Seibu
            destination.isSaudaraSeibu = self.isSaudaraSeibu
            destination.isSaudaraSeibuLaki = self.isSaudaraSeibuLaki
            destination.jumlahSaudaraSeibuLaki = self.jumlahSaudaraSeibuLaki
            destination.isSaudaraSeibuPerempuan = self.isSaudaraSeibuPerempuan
            destination.jumlahSaudaraSeibuPerempuan = self.jumlahSaudaraSeibuPerempuan
            
            //Anak Saudara
            destination.isAnakSaudara = self.isAnakSaudara
            destination.isAnakSaudaraKandungAshabah = self.isAnakSaudaraKandungAshabah
            destination.isAnakSaudaraSeayahAshabah = self.isAnakSaudaraSeayahAshabah
            destination.isAnakSaudaraKandung = self.isAnakSaudaraKandung
            destination.jumlahAnakSaudaraKandung = self.jumlahAnakSaudaraKandung
            destination.isAnakSaudaraSeayah = self.isAnakSaudaraSeayah
            destination.jumlahAnakSaudaraSeayah = self.jumlahAnakSaudaraSeayah
            
            
            //Paman
            destination.isPaman = self.isPaman
            destination.isPamanKandungAshabah = self.isPamanKandungAshabah
            destination.isPamanSeayahAshabah = self.isPamanSeayahAshabah
            destination.isPamanKandung = self.isPamanKandung
            destination.jumlahPamanKandung = self.jumlahPamanKandung
            destination.isPamanSeayah = self.isPamanSeayah
            destination.jumlahPamanSeayah = self.jumlahPamanSeayah
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
        
        if let destination = segue.destination as? AnakPamanViewController {
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
            
            //Saudara Seibu
            destination.isSaudaraSeibu = self.isSaudaraSeibu
            destination.isSaudaraSeibuLaki = self.isSaudaraSeibuLaki
            destination.jumlahSaudaraSeibuLaki = self.jumlahSaudaraSeibuLaki
            destination.isSaudaraSeibuPerempuan = self.isSaudaraSeibuPerempuan
            destination.jumlahSaudaraSeibuPerempuan = self.jumlahSaudaraSeibuPerempuan
            
            //Anak Saudara
            destination.isAnakSaudara = self.isAnakSaudara
            destination.isAnakSaudaraKandungAshabah = self.isAnakSaudaraKandungAshabah
            destination.isAnakSaudaraSeayahAshabah = self.isAnakSaudaraSeayahAshabah
            destination.isAnakSaudaraKandung = self.isAnakSaudaraKandung
            destination.jumlahAnakSaudaraKandung = self.jumlahAnakSaudaraKandung
            destination.isAnakSaudaraSeayah = self.isAnakSaudaraSeayah
            destination.jumlahAnakSaudaraSeayah = self.jumlahAnakSaudaraSeayah
            
            
            //Paman
            destination.isPaman = self.isPaman
            destination.isPamanKandungAshabah = self.isPamanKandungAshabah
            destination.isPamanSeayahAshabah = self.isPamanSeayahAshabah
            destination.isPamanKandung = self.isPamanKandung
            destination.jumlahPamanKandung = self.jumlahPamanKandung
            destination.isPamanSeayah = self.isPamanSeayah
            destination.jumlahPamanSeayah = self.jumlahPamanSeayah
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
    }
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        let jumlahPamanKandung = Int(textField.text!) ?? 0
        if jumlahPamanKandung >= 1 {
            pamanSeayahTextField.isEnabled = false
            pamanSeayahTextField.text = ""
            skipPamanSeayahLabel.isHidden = false
        }
        else {
            pamanSeayahTextField.isEnabled = true
            skipPamanSeayahLabel.isHidden = true
        }
        
    }
}
