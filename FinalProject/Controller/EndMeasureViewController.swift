//
//  EndMeasureViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 2/28/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class EndMeasureViewController: UIViewController {
    
    @IBOutlet weak var ahliWarisLabel: UILabel!
    //Harta dan Gender
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
    
    //Anak Paman
    var isAnakPaman = false
    
    var isAnakPamanKandungAshabah = false
    var isAnakPamanSeayahAshabah = false
    
    var isAnakPamanKandung = false
    var jumlahAnakPamanKandung = 0
    
    var isAnakPamanSeayah = false
    var jumlahAnakPamanSeayah = 0
    
    //Bagian Awal Ashabul Furud
    var bagianAyahAwal = 0.0
    var bagianIbuAwal = 0.0
    var bagianPasanganAwal = 0.0
    var bagianAnakPerempuanAwal = 0.0
    var bagianCucuPerempuanAwal = 0.0
    var bagianKakekAwal = 0.0
    var bagianNenekAwal = 0.0
    var bagianSaudaraPerempuanKandungAwal = 0.0
    var bagianSaudaraPerempuanSeayahAwal = 0.0
    var bagianSaudaraSeibuAwal = 0.0
    
    // Bagian Akhir Ashabul Furud
    var bagianAyah = 0.0
    var bagianIbu = 0.0
    var bagianPasangan = 0.0
    var bagianAnakPerempuan = 0.0
    var bagianCucuPerempuan = 0.0
    var bagianKakek = 0.0
    var bagianNenek = 0.0
    var bagianSaudaraPerempuanKandung = 0.0
    var bagianSaudaraPerempuanSeayah = 0.0
    var bagianSaudaraSeibu = 0.0
    
    //Bagian Ashabul Furud Dengan Type Rational
    var rationalBagianAyah: Rational!
    var rationalBagianIbu: Rational!
    var rationalBagianPasangan: Rational!
    var rationalBagianAnakPerempuan: Rational!
    var rationalBagianCucuPerempuan: Rational!
    var rationalBagianKakek: Rational!
    var rationalBagianNenek: Rational!
    var rationalBagianSaudaraPerempuanKandung: Rational!
    var rationalBagianSaudaraPerempuanSeayah: Rational!
    var rationalBagianSaudaraSeibu: Rational!
    
    var rationalTotalBagian: Rational!
    
    //Harta dan Bagian
    var totalBagian = 0.0

    var hartaSiapBagi = 0.0
    var hartaUntukSemua = 0.0
    var hartaUntukPasangan = 0.0
    var hartaSisa = 0.0
    var hartaKotor = 0.0
    var pengurusanJenazah = 0.0
    var hutang = 0.0
    var wasiat = 0.0
    
    //Bagian Ahli Waris
    var hartaAyah = 0.0
    var hartaIbu = 0.0
    var hartaPasangan = 0.0
    var hartaAnakLaki = 0.0
    var hartaAnakParempuan = 0.0
    var hartaCucuLaki = 0.0
    var hartaCucuPerempuan = 0.0
    var hartaKakek = 0.0
    var hartaNenek = 0.0
    var hartaSaudaraLakiKandung = 0.0
    var hartaSaudaraPerempuanKandung = 0.0
    var hartaSaudaraLakiSeayah = 0.0
    var hartaSaudaraPerempuanSeayah = 0.0
    var hartaSaudaraSeibu = 0.0
    var hartaAnakSaudaraKandung = 0.0
    var hartaAnakSaudaraSeayah = 0.0
    var hartaPamanKandung = 0.0
    var hartaPamanSeayah = 0.0
    var hartaAnakPamanKandung = 0.0
    var hartaAnakPamanSeayah = 0.0
    
    //Pokok Awal dan Akhir
    var pokokMasalahAwal = 0
    var pokokMasalahAkhir = 0
    
    var ahliWaris = [AhliWaris]()
    
    var statusBagianHarga: Status!
    
    var isNenek = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = jumlahNenekDariIbu + jumlahNenekDariAyah
        if a > 0 {
            isNenek = true
        } else {
            isNenek = false
        }
        
        printOutAhliWaris()
        checkBagian()
        setTotalBagian()
    }
    
    @IBAction func pressed(_ sender: UIButton) {
        createAhliWarisModel()
        setJumlahAshabah()
        performSegue(withIdentifier: "toHasilFromEnd", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HasilViewController {
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
            
            //Anak Paman
            destination.isAnakPaman = self.isAnakPaman
            destination.isAnakPamanKandungAshabah = self.isAnakPamanKandungAshabah
            destination.isAnakPamanSeayahAshabah = self.isAnakPamanSeayahAshabah
            destination.isAnakPamanKandung = self.isAnakPamanKandung
            destination.jumlahAnakPamanKandung = self.jumlahAnakPamanKandung
            destination.isAnakPamanSeayah = self.isAnakPamanSeayah
            destination.jumlahAnakPamanSeayah = self.jumlahAnakPamanSeayah
            
            //Hitung Bagian Ashabul Furud
            destination.bagianAyah = self.bagianAyah
            destination.bagianIbu = self.bagianIbu
            destination.bagianPasangan = self.bagianPasangan
            destination.bagianAnakPerempuan = self.bagianAnakPerempuan
            destination.bagianCucuPerempuan = self.bagianCucuPerempuan
            destination.bagianKakek = self.bagianKakek
            destination.bagianNenek = self.bagianNenek
            destination.bagianSaudaraPerempuanKandung = self.bagianSaudaraPerempuanKandung
            destination.bagianSaudaraPerempuanSeayah = self.bagianSaudaraPerempuanSeayah
            destination.bagianSaudaraSeibu = self.bagianSaudaraSeibu
            
            //Bagian Ashabul Furud Dengan Type Rational
            destination.rationalBagianAyah = self.rationalBagianAyah
            destination.rationalBagianIbu = self.rationalBagianIbu
            destination.rationalBagianPasangan = self.rationalBagianPasangan
            destination.rationalBagianAnakPerempuan = self.rationalBagianAnakPerempuan
            destination.rationalBagianCucuPerempuan = self.rationalBagianCucuPerempuan
            destination.rationalBagianKakek = self.rationalBagianKakek
            destination.rationalBagianNenek = self.rationalBagianNenek
            destination.rationalBagianSaudaraPerempuanKandung = self.rationalBagianSaudaraPerempuanKandung
            destination.rationalBagianSaudaraPerempuanSeayah = self.rationalBagianSaudaraPerempuanSeayah
            destination.rationalBagianSaudaraSeibu = self.rationalBagianSaudaraSeibu
            destination.rationalTotalBagian = self.rationalTotalBagian
            
            //Harta dan Bagian
            destination.hartaSisa = self.hartaSisa
            destination.totalBagian = self.totalBagian
            
            //Aul dan Radd
            
            //Pokok Awal dan Akhir
            destination.pokokMasalahAwal = self.pokokMasalahAwal
            destination.pokokMasalahAkhir = self.pokokMasalahAkhir
            
            destination.ahliWaris = self.ahliWaris
            
            destination.statusBagianHarga = self.statusBagianHarga
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
            
            destination.jumlahLakiAshabah = self.jumlahLakiAshabah
            destination.jumlahPerempuanAshabah = self.jumlahPerempuanAshabah
            destination.totalJumlahAshabah =  self.totalJumlahAshabah
            destination.ashabahJamak = self.ashabahJamak
        }
    }
    
    var jumlahLakiAshabah = 0
    var jumlahPerempuanAshabah = 0
    var totalJumlahAshabah = 0
    var ashabahJamak = false
    
    func setJumlahAshabah(){
        if isAyahAshabah {
            jumlahLakiAshabah = 1
            ashabahJamak = false
            
            if isIbu {
                if bagianIbu == 0 {
                    jumlahPerempuanAshabah = 1
                    ashabahJamak = true
                }
            }
        }
        
        else if isAnakLakiAshabah {
            jumlahLakiAshabah = jumlahAnakLaki
            ashabahJamak = false
            
            if isAnakPerempuan {
                jumlahPerempuanAshabah = jumlahAnakPerempuan
                ashabahJamak = true
            }
        }
        
        else if isCucuLakiAshabah {
            jumlahLakiAshabah = jumlahCucuLaki
            ashabahJamak = false
            
            if isCucuPerempuan {
                jumlahPerempuanAshabah = jumlahCucuPerempuan
                ashabahJamak = true
            }
        }
        
        else if isKakekAshabah {
            jumlahLakiAshabah = 1
            ashabahJamak = false
        }
        
        else if isSaudaraKandungLakiAshabah {
            jumlahLakiAshabah = jumlahSaudaraKandungLaki
            ashabahJamak = false
            
            if isSaudaraKandungPerempuan {
                jumlahPerempuanAshabah = jumlahSaudaraKandungPerempuan
                ashabahJamak = true
            }
        }
        
        else if isSaudaraSeayahLakiAshabah {
            jumlahLakiAshabah = jumlahSaudaraSeayahLaki
            ashabahJamak = false
            
            if isSaudaraSeayahPerempuan {
                jumlahPerempuanAshabah = jumlahSaudaraSeayahPerempuan
                ashabahJamak = true
            }
        }
        
        else if isAnakSaudaraKandungAshabah {
            jumlahLakiAshabah = jumlahAnakSaudaraKandung
            ashabahJamak = false
        }
        
        else if isAnakSaudaraSeayahAshabah {
            jumlahLakiAshabah = jumlahAnakSaudaraSeayah
            ashabahJamak = false
        }
        
        else if isPamanKandungAshabah {
            jumlahLakiAshabah = jumlahPamanKandung
            ashabahJamak = false
        }
        
        else if isPamanSeayahAshabah {
            jumlahLakiAshabah = jumlahPamanSeayah
            ashabahJamak = false
        }
        
        else if isAnakPamanKandungAshabah {
            jumlahLakiAshabah = jumlahAnakPamanKandung
            ashabahJamak = false
        }
        
        else if isAnakPamanSeayahAshabah {
            jumlahLakiAshabah = jumlahAnakPamanSeayah
            ashabahJamak = false
        }
        
        if isAshabahMaalGhair {
            if isSaudaraKandungPerempuanAshabah {
                jumlahPerempuanAshabah = jumlahSaudaraKandungPerempuan
            } else if isSaudaraSeayahPerempuanAshabah {
                jumlahPerempuanAshabah = jumlahSaudaraSeayahPerempuan
            }
            ashabahJamak = false
        }
        
        totalJumlahAshabah = jumlahLakiAshabah + jumlahPerempuanAshabah
        
        print("Jumlah ashabah laki-laki adalah = \(jumlahLakiAshabah)")
        print("Jumlah ashabah perempuan adalah = \(jumlahPerempuanAshabah)")
        print("Jumlah ashabah adalah = \(totalJumlahAshabah)")
        print("Apakah ada ashabah jamak = \(ashabahJamak)")

    }
}
