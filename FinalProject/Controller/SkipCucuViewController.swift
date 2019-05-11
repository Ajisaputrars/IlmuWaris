//
//  SkipCucuViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 2/26/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class SkipCucuViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Udah ada ashabahnya? \(isAshabah)")

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
        if isAyah == true {
            if isIbu == true {
                performSegue(withIdentifier: "toSkipKakekNenekFromSkipCucu", sender: nil)
            } else {
                performSegue(withIdentifier: "toKakekNenekFromSkipCucu", sender: nil)
            }
        } else if isAyah == false {
            performSegue(withIdentifier: "toKakekNenekFromSkipCucu", sender: nil)
        }
    }
    
    func printCheck(){
        print ("")
        print ("Berikut ini adalah jumlah semua keluarga dari Skip Cucu View Controller")
        print ("")
        print ("GENDER adalah = \(gender)")
        print ("Harta siap bagi adalah = \(hartaSiapBagi)")
        print ("Apakah sudah ada Ashabah = \(isAshabah)")
        print ("Apakah Ayah Ashabah?  = \(isAyahAshabah)")
        print ("Apakah Anak laki2 Ashabah?  = \(isAnakLakiAshabah)")
        print ("Apakah ada pasangan?  = \(isPasangan)")
        print ("Jumlah pasangan = \(jumlahPasangan)")
        print ("Ayah ada?  = \(isAyah)")
        print ("Ibu ada? = \(isIbu)")
        print ("Anak ada?  = \(isAnak)")
        print ("Jumlah Anak Laki-laki adalah = \(jumlahAnakLaki)")
        print ("Jumlah Anak Perempuan adalah = \(jumlahAnakPerempuan)")
        print ("")
    }
}
