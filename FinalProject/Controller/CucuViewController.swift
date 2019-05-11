//
//  CucuViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 2/26/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class CucuViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var cucuLakiTextField: UITextField!
    @IBOutlet weak var skipCucuPerempuanLabel: UILabel!
    @IBOutlet weak var cucuPerempuanTextField: UITextField!
    
    var hartaKotor = 0.0
    var pengurusanJenazah = 0.0
    var hutang = 0.0
    var wasiat = 0.0
    var hartaSiapBagi = 0.0
    var gender = ""
    
    var isAshabah = false
    var isAyahAshabah = false
    var isAnakLakiAshabah = false
    var isCucuLakiAshabah = false
    
    var isPasangan = false
    var jumlahPasangan = 0
    
    var isAyah = false
    var isIbu = false
    
    var isAnak = false
    
    var isAnakLaki = false
    var jumlahAnakLaki = 0
    
    var isAnakPerempuan = false
    var jumlahAnakPerempuan = 0
    
    var isCucu = false
    
    var isCucuLaki = false
    var jumlahCucuLaki = 0
    
    var isCucuPerempuan = false
    var jumlahCucuPerempuan = 0
    
    private var jmlCucuLaki: Int {
        if cucuLakiTextField.text == "" {
            return 0
        }
        return Int(cucuLakiTextField.text!)!
    }
    
    private var jmlCucuPerempuan: Int {
        if cucuPerempuanTextField.text == "" {
            return 0
        }
        return Int(cucuPerempuanTextField.text!)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skipCucuPerempuanLabel.isHidden = true
        
        if jumlahAnakPerempuan > 1 {
            cucuPerempuanTextField.isEnabled = false
            skipCucuPerempuanLabel.isHidden = false
        }
        
        cucuLakiTextField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //printCheck()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? KakekNenekViewController {
            destination.hartaSiapBagi = self.hartaSiapBagi
            destination.gender =  self.gender
            destination.isAshabah = self.isAshabah
            destination.isAyahAshabah = self.isAyahAshabah
            destination.isAnakLakiAshabah = self.isAnakLakiAshabah
            destination.isCucuLakiAshabah = self.isCucuLakiAshabah
            destination.isPasangan = self.isPasangan
            destination.jumlahPasangan = self.jumlahPasangan
            destination.isAyah = self.isAyah
            destination.isIbu = self.isIbu
            destination.isAnak = self.isAnak
            destination.isAnakLaki = self.isAnakLaki
            destination.jumlahAnakLaki = self.jumlahAnakLaki
            destination.isAnakPerempuan = self.isAnakPerempuan
            destination.jumlahAnakPerempuan = self.jumlahAnakPerempuan
            destination.isCucu = self.isCucu
            destination.isCucuLaki = self.isCucuLaki
            destination.jumlahCucuLaki = self.jumlahCucuLaki
            destination.isCucuPerempuan = self.isCucuPerempuan
            destination.jumlahCucuPerempuan = self.jumlahCucuPerempuan
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
        
        if let destination = segue.destination as? SkipKakekNenekViewController {
            destination.hartaSiapBagi = self.hartaSiapBagi
            destination.gender =  self.gender
            destination.isAshabah = self.isAshabah
            destination.isAyahAshabah = self.isAyahAshabah
            destination.isAnakLakiAshabah = self.isAnakLakiAshabah
            destination.isCucuLakiAshabah = self.isCucuLakiAshabah
            destination.isPasangan = self.isPasangan
            destination.jumlahPasangan = self.jumlahPasangan
            destination.isAyah = self.isAyah
            destination.isIbu = self.isIbu
            destination.isAnak = self.isAnak
            destination.isAnakLaki = self.isAnakLaki
            destination.jumlahAnakLaki = self.jumlahAnakLaki
            destination.isAnakPerempuan = self.isAnakPerempuan
            destination.jumlahAnakPerempuan = self.jumlahAnakPerempuan
            destination.isCucu = self.isCucu
            destination.isCucuLaki = self.isCucuLaki
            destination.jumlahCucuLaki = self.jumlahCucuLaki
            destination.isCucuPerempuan = self.isCucuPerempuan
            destination.jumlahCucuPerempuan = self.jumlahCucuPerempuan
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
    }
    
    @IBAction func buttonNextPressed(_ sender: Any) {
        setAbstractionLocalVariable()
        //printCheck()
        
        if isAyah == true {
            if isIbu == true {
                performSegue(withIdentifier: "toSkipKakekNenekFromCucu", sender: nil)
            } else {
                performSegue(withIdentifier: "toKakekNenekFromCucu", sender: nil)
            }
        } else if isAyah == false {
            performSegue(withIdentifier: "toKakekNenekFromCucu", sender: nil)
        }
    }
    
    func setAbstractionLocalVariable(){
        isCucu = false
        isCucuLaki = false
        isCucuPerempuan = false
        isCucuLakiAshabah = false
        
        if isAyahAshabah == true {
            isAshabah = true
        } else if isAnakLakiAshabah == true {
            isAshabah = true
        } else {
            isAshabah = false
        }
        
        
        jumlahCucuLaki = jmlCucuLaki
        jumlahCucuPerempuan = jmlCucuPerempuan
        
        if jumlahCucuLaki > 0 {
            isCucuLaki = true
        }
        else if jumlahCucuLaki <= 0 {
            isCucuLaki = false
        }
        
        if jumlahCucuPerempuan > 0 {
            isCucuPerempuan = true
        }
            
        else if jumlahCucuPerempuan <= 0  {
            isCucuPerempuan = false
        }
        
        if (isCucuLaki || isCucuPerempuan) {
            isCucu = true
        }
        
        if isCucuLaki == true {
            if isAyahAshabah == true{
                isAyahAshabah = false
                isCucuLakiAshabah = true
            } else {
                if isAnakLakiAshabah == true {
                    isCucuLakiAshabah = false
                }
                else {
                    isCucuLakiAshabah = true
                }
            }
        }
        
        if (isAyahAshabah || isAnakLakiAshabah || isCucuLakiAshabah){
            isAshabah = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if jumlahAnakPerempuan > 1 {
            let jumlahCucuLaki = Int(textField.text!) ?? 0
            if jumlahCucuLaki >= 1 {
                cucuPerempuanTextField.isEnabled = true
                skipCucuPerempuanLabel.isHidden = true
            }
            else {
                skipCucuPerempuanLabel.isHidden = false
                cucuPerempuanTextField.text = ""
                cucuPerempuanTextField.isEnabled = false
            }
        }
    }
    
    func printCheck(){
        
        print ("")
        print ("Berikut ini adalah jumlah semua keluarga dari Cucu View Controller")
        print ("")
        
        print("cucu ada? = \(isCucu)")
        print("cucu perempuan ada? = \(isCucuPerempuan)")
        print("jumlahnya? = \(jumlahCucuPerempuan)")
        print("cucu laki ada? = \(isCucuLaki)")
        print("jumlahnya? = \(jumlahCucuLaki)")
        
        print("udah ada ashabahnya? = \(isAshabah)")
        print("cucu laki ashabah? = \(isCucuLakiAshabah)")
    }
}
