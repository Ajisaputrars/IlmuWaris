//
//  AnakSaudaraViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 3/7/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class AnakSaudaraViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var anakLakiSaudaraSeayahTextField: UITextField!
    @IBOutlet weak var anakLakiSaudaraKandungTextField: UITextField!

    @IBOutlet weak var skipAnakSaudaraSeayahLabel: UILabel!
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
    
    var jmlAnakSaudaraKandung: Int {
        if anakLakiSaudaraKandungTextField.text == "" {
            return 0
        }
        
        return Int(anakLakiSaudaraKandungTextField.text!)!
    }
    
    var jmlAnakSaudaraSeayah: Int {
        if anakLakiSaudaraSeayahTextField.text == "" {
            return 0
        }
        
        return Int(anakLakiSaudaraSeayahTextField.text!)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        skipAnakSaudaraSeayahLabel.isHidden = true
        anakLakiSaudaraKandungTextField.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingChanged)
    }
    
    @IBAction func buttonNextPressed(_ sender: Any) {
        setAbstractionLocalVariables()
        
        if isAshabah {
            performSegue(withIdentifier: "toEndFromAnakSaudara", sender: nil)
        } else {
            performSegue(withIdentifier: "toPamanFromAnakSaudara", sender: nil)
        }
    }
    
    func setAbstractionLocalVariables(){
        jumlahAnakSaudaraKandung = jmlAnakSaudaraKandung
        jumlahAnakSaudaraSeayah = jmlAnakSaudaraSeayah
        
        if jumlahAnakSaudaraKandung > 0 {
            isAnakSaudaraKandung = true
        } else if jumlahAnakSaudaraKandung <= 0 {
            isAnakSaudaraKandung = false
        }
        
        if jumlahAnakSaudaraSeayah > 0 {
            isAnakSaudaraSeayah = true
        } else if jumlahAnakSaudaraSeayah <= 0 {
            isAnakSaudaraSeayah = false
        }
        
        if isAnakSaudaraSeayah || isAnakSaudaraKandung {
            isAnakSaudara = true
        } else {
            isAnakSaudara = false
        }
        
        checkAshabah()
    }
    
    func checkAshabah(){
        if isAnakSaudaraKandung == true {
            isAnakSaudaraKandungAshabah = true
            isAshabah = true
            
        } else if isAnakSaudaraKandung == false {
            isAnakSaudaraKandungAshabah = false
            isAshabah = false
            
            if isAnakSaudaraSeayah == true {
                isAnakSaudaraSeayahAshabah = true
                isAshabah = true
            } else if isAnakSaudaraSeayah == false {
                isAnakSaudaraSeayahAshabah = false
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
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
        
        if let destination = segue.destination as? PamanViewController {
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
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let jumlahAnakSaudaraKandungLaki = Int(textField.text!) ?? 0
        if jumlahAnakSaudaraKandungLaki >= 1 {
            anakLakiSaudaraSeayahTextField.isEnabled = false
            anakLakiSaudaraSeayahTextField.text = ""
            skipAnakSaudaraSeayahLabel.isHidden = false
        }
        else {
            anakLakiSaudaraSeayahTextField.isEnabled = true
            skipAnakSaudaraSeayahLabel.isHidden = true
        }
        
    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if jumlahAnakPerempuan > 1 {
//            let jumlahCucuLaki = Int(textField.text!) ?? 0
//            if jumlahCucuLaki >= 1 {
//                cucuPerempuanTextField.isEnabled = true
//                skipCucuPerempuanLabel.isHidden = true
//            }
//            else {
//                skipCucuPerempuanLabel.isHidden = false
//                cucuPerempuanTextField.text = ""
//                cucuPerempuanTextField.isEnabled = false
//            }
//        }
//    }
}
