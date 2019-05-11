//
//  AhliWaris.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 4/16/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

class AhliWaris {
    
    private var _nama = ""
    private var _bagian = 0.0
    private var _harta = 0.0
    private var _tag = [String]()
    private var _ashabahAyahWithIbu = false
    private var _bagianAshabah = 0.0
    private var _jumlahAhliWaris = 0
    private var _jumlahTotalBersekutu = 0
    private var _bagianTotalBersekutu = 0.0
    private var _bagianAwal = 0.0
    private var _isAshabah = false
    private var _jenisKelamin = ""
    
    var nama:String {
        return _nama
    }
    
    var bagian:Double {
        get {
            return _bagian
        } set {
            _bagian = newValue
        }
    }
    
    var isAshabah: Bool {
        get {
            return _isAshabah
        } set {
            _isAshabah = newValue
        }
    }
    
    var harta:Double {
        get {
            return _harta
        } set {
            _harta = newValue
        }
    }
    
    var jumlahAhliWaris: Int {
        return _jumlahAhliWaris
    }
    
    var rationalBagian:Rational {
        let rational = rationalApproximationOf(x0: bagian)
        return rational
    }
    
    var jumlahTotalBersekutu:Int {
        return _jumlahTotalBersekutu
    }
    
    var ashabahAyahWithIbu:Bool {
        return _ashabahAyahWithIbu
    }
    
    var bagianTotalBersekutu:Double {
        return _bagianTotalBersekutu
    }
    
    var rationalBagianTotalBersekutu:Rational {
        return rationalApproximationOf(x0: bagianTotalBersekutu)
    }
    
    var bagianAwal: Double {
        return _bagianAwal
    }
    
    var rationalBagianAwal:Rational {
        let rational = rationalApproximationOf(x0: _bagianAwal)
        return rational
    }
    
    var bagianAwalString: String {
        let b = rationalApproximationOf(x0: _bagianAwal)
        let t = "\(b.num)/\(b.den)"
        return t
    }
    
    var rationalBagianAkhir: Rational {
        return rationalApproximationOf(x0: bagianAwal)
    }
    
    var displayName: String {
        if nama == "Ayah" || nama == "Ibu" || nama == "Suami" || nama == "Kakek" || nama == "Baitul Mal" {
            return nama
        }
        return "\(jumlahAhliWaris) \(nama)"
    }
    
    var jenisKelamin:String {
        get {
            return _jenisKelamin
        } set {
            _jenisKelamin = newValue
        }
    }
    
    var bagianWarisan: String {
        if bagian == 2 {
            return "A(2:1)"
        } else if bagian == 3 {
            return "A(1:1)"
        } else if bagian == 4 {
            return "Ashabah"
        }
        
        return "\(rationalBagian.num)/\(rationalBagian.den)"
    }
    
    var tag: [String] {
        return _tag
    }
    
    var bagianAshabah: Double {
        return _bagianAshabah
    }
    
    init(nama:String, bagian:Double, harta:Double, tag:[String] = [String](), ashabahAyahWithIbu:Bool = false, bagianAshabah: Double = 0.0 ) {
        self._nama = nama
        self._bagian = bagian
        self._harta = harta
        self._tag = tag
        self._ashabahAyahWithIbu = ashabahAyahWithIbu
    }
    
    init(nama:String, bagian:Double, jumlah:Int, harta:Double, tag:[String] = [String](), ashabahAyahWithIbu:Bool = false, bagianAshabah: Double = 0.0, jumlahTotalBersekutu: Int = 0, bagianAwal:Double = 0.0, bagianTotalBersekutu: Double = 0.0, isAshabah: Bool = false, jenisKelamin:String = "Tidak Teridentifikasi" ) {
        self._nama = nama
        self._bagian = bagian
        self._harta = harta
        self._tag = tag
        self._ashabahAyahWithIbu = ashabahAyahWithIbu
        self._jumlahAhliWaris = jumlah
        self._bagianTotalBersekutu = bagianTotalBersekutu
        self._isAshabah = isAshabah
        
        if bagianAwal == 0 {
            self._bagianAwal = bagian
        } else {
             self._bagianAwal =  bagianAwal
        }
        
        if jumlahTotalBersekutu == 0 {
            _jumlahTotalBersekutu = _jumlahAhliWaris
        } else {
            _jumlahTotalBersekutu = jumlahTotalBersekutu
        }
        if bagianTotalBersekutu ==  0 {
            self._bagianTotalBersekutu = bagian
        }
        self._jenisKelamin = jenisKelamin
    }
}
