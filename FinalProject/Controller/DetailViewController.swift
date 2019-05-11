//
//  DetailViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 5/3/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var namaAhliWarisLabel: UILabel!
    @IBOutlet weak var jumlahAhliWarisLabel: UILabel!
    @IBOutlet weak var bagianAwalLabel: UILabel!
    @IBOutlet weak var statusAulRaddLabel: UILabel!
    @IBOutlet weak var bagianAkhirBersekutuLabel: UILabel!
    @IBOutlet weak var kadarBagianBersekutuLabel: UILabel!
    @IBOutlet weak var bagianAkhirLabel: UILabel!
    @IBOutlet weak var totalHartaAhliWarisLabel: UILabel!
    @IBOutlet weak var hartaPerKepalaAhliWarisLabel: UILabel!
    
    @IBOutlet weak var jumlahAhliWarisIndividuLabel: UILabel!
    @IBOutlet weak var kadarBagianIndividuLabel: UILabel!
    @IBOutlet weak var xJumlahAhliWarisIndividuLabel: UILabel!
    @IBOutlet weak var xKadarBagianIndividuLabel: UILabel!
    
    @IBOutlet weak var jumlahAhliWarisIndividuLabelConstrain: NSLayoutConstraint!
    @IBOutlet weak var kadarBagianIndividuLabelConstrain: NSLayoutConstraint!
    @IBOutlet weak var xJumlahAhliWarisIndividuLabelConstrain: NSLayoutConstraint!
    @IBOutlet weak var xKadarBagianIndividuLabelConstrain: NSLayoutConstraint!
    @IBOutlet weak var xKadarBagianIndividuLabelHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var viewTopConstrain: NSLayoutConstraint!
    @IBOutlet weak var kadarBagianBersekutuLabelHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var bagianAkhirBersekuTuLabelHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var kadarBagianBersekutuLabelHeightConstrain2: NSLayoutConstraint!
    @IBOutlet weak var bagianAkhirBersekuTuLabelHeightConstrain2: NSLayoutConstraint!
    @IBOutlet weak var hartaTambahanAshabahLabelTopConstrain: NSLayoutConstraint!
    @IBOutlet weak var tambahanAshabahLabelTopConstrain: NSLayoutConstraint!
    @IBOutlet weak var hartaTambahanAshabahLabelHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var tambahanAshabahLabelHeightConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var hartaTambahanAshabahLabel: UILabel!
    @IBOutlet weak var tambahanAshabahLabel: UILabel!
    @IBOutlet weak var jumlahAhliWarisBersekutuLabel: UILabel!
    @IBOutlet weak var totalHartaAhliWarisIndividu: UILabel!
    @IBOutlet weak var totalHartaAhliWarisBersekutu: UILabel!
    @IBOutlet weak var navigationItems: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    var ahliWaris:AhliWaris!
    var ahliWarisArray: [AhliWaris]!
    var statusOf: Status!
    var dalilSelected: [Dalil]!
    var pokokMasalahAwal: Int!
    var pokokMasalahAkhir: Int!
    var dalil: NSFetchedResultsController<Dalil> = CoreDataObject.shared.dalil
    
    var adaSekutu = false
    var nenekBersekutu = false
    var saudaraSeibuBersekutu = false
    
    var hartaSiapBagi = 0.0
    var hartaSisa = 0.0
    
    var jumlahLakiAshabah = 0
    var jumlahPerempuanAshabah = 0
    var totalJumlahAshabah = 0
    
    var ashabahJamak = false

    override func viewDidLoad() {
        super.viewDidLoad()
        dalilSelected = [Dalil]()
        self.title = "Detail Ahli Waris"
        setUpMenuButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        tableView.allowsSelection = false
        
        checkAdaSekutu()
        checkAyahKakek()
        setupMainView()
        setDalil()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        printDetailInfo()
    }
    
    //Mengecek jika ada sekutu, lalu memberikan statusnya pada sebuah variabel
    func checkAdaSekutu(){
        if ahliWaris.nama == "Nenek dari Ayah" || ahliWaris.nama == "Nenek dari Ibu" {
            adaSekutu = true
            nenekBersekutu = true
            saudaraSeibuBersekutu = false
        } else if ahliWaris.nama == "Saudara Seibu Perempuan" || ahliWaris.nama == "Saudara Seibu Laki-laki" {
            adaSekutu = true
            nenekBersekutu = false
            saudaraSeibuBersekutu = true
        } else {
            adaSekutu = false
            nenekBersekutu = false
            saudaraSeibuBersekutu = false
            
            setHeightZero()
        }
    }
    
    //Hanya cek apakah ada Ayah atau Kakek, lalu melakukan keputusan untuk show/hide Label tambahan Ashabah
    func checkAyahKakek(){
        if (ahliWaris.nama == "Ayah" || ahliWaris.nama == "Kakek") && ahliWaris.isAshabah == true {
            //TODO: Perbaiki
            
            if ahliWaris.bagian > 1 {
                tambahanAshabahLabel.isHidden = true
                hartaTambahanAshabahLabel.isHidden = true
                tambahanAshabahLabelHeightConstrain.constant = 0
                hartaTambahanAshabahLabelHeightConstrain.constant = 0
                tambahanAshabahLabelTopConstrain.constant = 0
                hartaTambahanAshabahLabelTopConstrain.constant = 0
            } else {
                tambahanAshabahLabel.text = "Tambahan harta Ashabah untuk \(ahliWaris.nama)"
                hartaTambahanAshabahLabel.text = String(hartaSisa).toRupiahCurrency + " (Harta Sisa)"
            }
            
            print("Ini adalah ayah atau kakek")
        } else {
            tambahanAshabahLabel.isHidden = true
            hartaTambahanAshabahLabel.isHidden = true
            tambahanAshabahLabelHeightConstrain.constant = 0
            hartaTambahanAshabahLabelHeightConstrain.constant = 0
            tambahanAshabahLabelTopConstrain.constant = 0
            hartaTambahanAshabahLabelTopConstrain.constant = 0
        }
    }
    
    func setupMainView(){
        if adaSekutu {
            print("Ada sekutu nich")
            
            var jumlahBersekutu = 0
            var bagianBersekutu = 0.0
            
            if nenekBersekutu {
                for i in ahliWarisArray {
                    if i.nama == "Nenek" {
                        jumlahBersekutu = i.jumlahTotalBersekutu
                        bagianBersekutu = i.bagianTotalBersekutu
                    }
                }
                jumlahAhliWarisBersekutuLabel.text = "Jumlah Nenek"
                
                totalHartaAhliWarisBersekutu.text = "Total harta untuk Nenek"
            } else if saudaraSeibuBersekutu {
                for i in ahliWarisArray {
                    if i.nama == "Saudara Seibu" {
                        jumlahBersekutu = i.jumlahTotalBersekutu
                        bagianBersekutu = i.bagianTotalBersekutu
                    }
                }
                jumlahAhliWarisBersekutuLabel.text = "Jumlah Saudara Seibu"
                
                totalHartaAhliWarisBersekutu.text = "Total harta untuk Saudara Seibu"
            }
            jumlahAhliWarisIndividuLabel.text = "Jumlah dari \(ahliWaris.nama)"
            
            let y = ahliWaris.rationalBagianTotalBersekutu
            let yNum = Double(y.num)
            let yDen = Double(y.den)
            let z = yNum/yDen
            let harta = String(Double(z * hartaSiapBagi)).toRupiahCurrency
            let hartaSiapBagiRupiah = String(hartaSiapBagi).toRupiahCurrency
            totalHartaAhliWarisLabel.text = "\(y.num)/\(y.den) x \(hartaSiapBagiRupiah) = \(harta)"
            
            let bagianBersekutuRational = rationalApproximationOf(x0: bagianBersekutu)
            jumlahAhliWarisLabel.text = "\(jumlahBersekutu)"
            bagianAwalLabel.text = "\(bagianBersekutuRational.num)/\(bagianBersekutuRational.den)"
            xJumlahAhliWarisIndividuLabel.text = "\(ahliWaris.jumlahAhliWaris)"
            xKadarBagianIndividuLabel.text = ahliWaris.bagianAwalString
            
            totalHartaAhliWarisIndividu.text = "Harta masing-masing \(ahliWaris.nama)"
            
            
            let str1 = "\(ahliWaris.jumlahAhliWaris)/\(ahliWaris.jumlahTotalBersekutu)"
            let str2 = "1/\(ahliWaris.jumlahAhliWaris)"
            let hartaPerIndividu = String(Double(1.0/Double(ahliWaris.jumlahTotalBersekutu)) * Double(z * hartaSiapBagi)).toRupiahCurrency
            var str3 = ""//\(str1) x \(harta) x \(str2) = \(hartaPerIndividu) "
            
            if ahliWaris.jumlahAhliWaris <= 1 {
                str3 = "\(str1) x \(harta) = \(hartaPerIndividu) "
            } else {
                str3 = "\(str1) x \(harta) x \(str2) = \(hartaPerIndividu) "
            }
            hartaPerKepalaAhliWarisLabel.text = str3
        }
        else {
            print("Kagak ada sekutu nich")
            jumlahAhliWarisBersekutuLabel.text = "Jumlah \(ahliWaris.nama)"
            jumlahAhliWarisLabel.text = "\(ahliWaris.jumlahAhliWaris)"
            bagianAwalLabel.text = ahliWaris.bagianAwalString
            totalHartaAhliWarisBersekutu.text = "Total harta untuk \(ahliWaris.nama)"
            
            let y = ahliWaris.rationalBagian
            let yNum = Double(y.num)
            let yDen = Double(y.den)
            let z = yNum/yDen
            let harta = String(Double(z * hartaSiapBagi)).toRupiahCurrency
            let hartaSiapBagiRupiah = String(hartaSiapBagi).toRupiahCurrency
            totalHartaAhliWarisLabel.text = "\(y.num)/\(y.den) x \(hartaSiapBagiRupiah) = \(harta)"
            
            let str1 = "1/\(ahliWaris.jumlahAhliWaris)"
            let str2 = String(Double(1.0/Double(ahliWaris.jumlahAhliWaris)) * (z * hartaSiapBagi)).toRupiahCurrency
            let str4 = String(Double(1.0/Double(ahliWaris.jumlahAhliWaris)) * (z * hartaSiapBagi) + hartaSisa).toRupiahCurrency
            var str3 = ""
            
            if ahliWaris.nama == "Suami" || ahliWaris.nama == "Ibu" || ahliWaris.nama == "Ayah" || ahliWaris.nama == "Kakek" {
                str3 = "\(str2)"
                
                if ahliWaris.nama == "Ayah" || ahliWaris.nama == "Kakek" {
                    if ahliWaris.isAshabah == true {
                        str3 = "\(str4)"
                    } else {
                        str3 = "\(str2)"
                    }
//                    str3 = "\(str4)"
                }
                
                totalHartaAhliWarisIndividu.text = "Harta akhir yang diberikan ke \(ahliWaris.nama)"
            } else {
                str3 = "\(str1) x \(harta) = \(str2)"
                totalHartaAhliWarisIndividu.text = "Harta untuk masing-masing \(ahliWaris.nama)"
            }
            hartaPerKepalaAhliWarisLabel.text = str3
        }
        
        if ahliWaris.bagian > 1 {
            let jumlahLaki = Double(jumlahLakiAshabah)
            let jumlahLakiDuaKaliLipat = 2 * jumlahLaki
            let jumlahPerempuan = Double(jumlahPerempuanAshabah)
            let jumlahAshabah = jumlahLakiDuaKaliLipat + jumlahPerempuan
            
            totalHartaAhliWarisBersekutu.text = "Total harta untuk seluruh \(ahliWaris.nama)"
            
            if ashabahJamak {
                if ahliWaris.jenisKelamin == "L" {
                    let bagianLaki = jumlahLakiDuaKaliLipat / jumlahAshabah
                    let bagianLakiRational = rationalApproximationOf(x0: bagianLaki)
                    
                    let hartaLaki = bagianLaki * hartaSisa
                    let hartaLakiString = String(hartaLaki).toRupiahCurrency
                    
                    let hartaLakiPerOrang = hartaLaki / jumlahLaki
                    let hartaLakiPerOrangString = String(hartaLakiPerOrang).toRupiahCurrency

                    
                    totalHartaAhliWarisLabel.text = "\(bagianLakiRational.num)/\(bagianLakiRational.den) x \(String(hartaSisa).toRupiahCurrency) (Harta Sisa) =  \(hartaLakiString)"
                    
                    hartaPerKepalaAhliWarisLabel.text = "\(hartaLakiString) x 1/\(Int(jumlahLaki)) = \(hartaLakiPerOrangString)"
                } else {
                    let bagianPerempuan = jumlahPerempuan / jumlahAshabah
                    let bagianPerempuanRational = rationalApproximationOf(x0: bagianPerempuan)
                    
                    let hartaPerempuan = bagianPerempuan * hartaSisa
                    let hartaPerempuanString = String(hartaPerempuan).toRupiahCurrency
                    
                    let hartaPerempuanPerOrang = hartaPerempuan / jumlahPerempuan
                    let hartaPerempuanPerOrangString = String(hartaPerempuanPerOrang).toRupiahCurrency
                    
                    
                    totalHartaAhliWarisLabel.text = "\(bagianPerempuanRational.num)/\(bagianPerempuanRational.den) x \(String(hartaSisa).toRupiahCurrency) (Harta Sisa) =  \(hartaPerempuanString)"
                    
                    hartaPerKepalaAhliWarisLabel.text = "\(hartaPerempuanString) x 1/\(Int(jumlahPerempuan)) = \(hartaPerempuanPerOrangString)"
                }
            }
            else {
                if ahliWaris.jenisKelamin == "L" {
                    totalHartaAhliWarisLabel.text = "\(hartaSisa)".toRupiahCurrency
                    let hartaPerKepala = hartaSisa / Double(ahliWaris.jumlahAhliWaris)
                    if ahliWaris.jumlahAhliWaris > 1 {
                        hartaPerKepalaAhliWarisLabel.text = "\(hartaSisa)".toRupiahCurrency + " x 1/\(ahliWaris.jumlahAhliWaris) = " + "\(hartaPerKepala)".toRupiahCurrency
                    } else {
                        hartaPerKepalaAhliWarisLabel.text = "\(hartaPerKepala)".toRupiahCurrency
                    }
                } else {
                    totalHartaAhliWarisLabel.text = "\(hartaSisa)".toRupiahCurrency
                    let hartaPerKepala = hartaSisa / Double(ahliWaris.jumlahAhliWaris)
                    if ahliWaris.jumlahAhliWaris > 1 {
                        hartaPerKepalaAhliWarisLabel.text = "\(hartaSisa)".toRupiahCurrency + " x 1/\(ahliWaris.jumlahAhliWaris) = " + "\(hartaPerKepala)".toRupiahCurrency
                    } else {
                        hartaPerKepalaAhliWarisLabel.text = "\(hartaPerKepala)".toRupiahCurrency
                    }
                }
            }
            
            if ahliWaris.harta <= 0 {
                totalHartaAhliWarisLabel.text = "Rp0 (Sudah Habis)"
                hartaPerKepalaAhliWarisLabel.text = "Rp0 (Sudah Habis)"
            }
            
        }
        
        let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
        let underlineAttributedString = NSAttributedString(string: ahliWaris.nama, attributes: underlineAttribute)
        namaAhliWarisLabel.attributedText = underlineAttributedString

        let bagianAwalAhliWaris = ahliWaris.bagianAwal
        let bagianAkhirAhliWaris = ahliWaris.bagian
        
        if bagianAwalAhliWaris < bagianAkhirAhliWaris {
            statusAulRaddLabel.text = "Radd"
        } else if bagianAwalAhliWaris > bagianAkhirAhliWaris {
            statusAulRaddLabel.text = "Aul"
        } else {
            statusAulRaddLabel.text = "Tak kena Aul / Radd"
            
            if ahliWaris.nama == "Suami" || ahliWaris.nama == "Istri" {
                if pokokMasalahAwal != pokokMasalahAkhir {
                    statusAulRaddLabel.text = "Tak kena Radd"
                }
            }
        }
        
        let x = rationalApproximationOf(x0: ahliWaris.bagian)
        bagianAkhirLabel.text = "\(x.num)/\(x.den)"
        
        let dr = rationalApproximationOf(x0: ahliWaris.bagianTotalBersekutu)
        bagianAkhirBersekutuLabel.text = "\(dr.num)/\(dr.den)"
        
        if ahliWaris.bagian > 1 {
            var stringBagianAshabah = ""
            if ahliWaris.bagian == 2 {
                stringBagianAshabah = "A(2:1)"
            } else {
                stringBagianAshabah = "A(1:1)"
            }
            
            bagianAwalLabel.text = stringBagianAshabah
            bagianAkhirLabel.text = stringBagianAshabah
            bagianAkhirBersekutuLabel.text = stringBagianAshabah
        }
    }
}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dalilSelected.count <= 0 {
            return 1
        } 
        return dalilSelected.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if dalilSelected.count <= 0 {
            print("Dalil Count sama dengan = \(dalilSelected.count)")
            return UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DalilCell") as! DalilCell
            let nomor = dalilSelected[indexPath.row]
            cell.configure(dalil: nomor)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Test tap dalil")
        let controller = DetailDalilController(nibName: "DetailDalilView", bundle: nil)
        navigationController?.pushViewController(controller, animated: true)
        controller.dalil = self.dalilSelected[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setUpMenuButton(){
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 25, height: 25)
        menuBtn.setImage(UIImage(named:"Info-White"), for: .normal)
        menuBtn.addTarget(self, action: #selector(onMenuButtonPressed), for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 24)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 24)
        currHeight?.isActive = true
        self.navigationItem.rightBarButtonItem = menuBarItem
    }
    
    @objc func onMenuButtonPressed(){
        print("Test Bar Button Item in Detail")
        var text = ""
        
        if ahliWaris.nama == "Suami" || ahliWaris.nama == "Istri" {
            text = "Pasangan" + "View"
        } else if ahliWaris.nama == "Nenek dari Ayah" || ahliWaris.nama == "Nenek dari Ibu" {
            text = "Nenek" + "View"
        } else if ahliWaris.nama == "Saudara Seibu Perempuan" || ahliWaris.nama == "Saudara Seibu Laki-laki" {
            text = "SaudaraSeibu" + "View"
        }
        else {
            if ahliWaris.bagian > 1 {
                if ahliWaris.nama == "Anak Perempuan" || ahliWaris.nama == "Cucu Perempuan" || ahliWaris.nama == "Saudara Kandung Perempuan" || ahliWaris.nama == "Saudara Seayah Perempuan" || ahliWaris.nama == "Ayah" || ahliWaris.nama == "Kakek" || ahliWaris.nama == "Ibu" {
                    text = self.ahliWaris.nama.replacingOccurrences(of: " ", with: "") + "View"
                } else {
                    text = "AshabahView"
                }
            } else {
                text = self.ahliWaris.nama.replacingOccurrences(of: " ", with: "") + "View"
            }
        }
        print("Textnya adalah = \(text) ")
        let controller = DetailIlmuWarisViewController(nibName: text, bundle: nil)
        controller.titleName = self.ahliWaris.nama
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension DetailViewController {
    
    func printDetail() {
        var bagianAwalBersekutu = 0.0
        if ahliWaris.nama == "Nenek dari Ayah" || ahliWaris.nama == "Nenek dari Ibu" {
            for i in ahliWarisArray {
                if i.nama == "Nenek" {
                    bagianAwalBersekutu = i.bagianAwal
                }
            }
        } else if ahliWaris.nama == "Saudara Seibu Laki-laki" || ahliWaris.nama == "Saudara Seibu Perempuan" {
            for i in ahliWarisArray {
                if i.nama == "Saudara Seibu" {
                    bagianAwalBersekutu = i.bagianAwal
                }
            }
        } else {
            bagianAwalBersekutu = ahliWaris.bagianAwal
        }
    }
    
    func setRincianPembagian(){
        
        totalHartaAhliWarisBersekutu.text = ""
        totalHartaAhliWarisLabel.text = ""
        
        totalHartaAhliWarisIndividu.text = ""
        hartaPerKepalaAhliWarisLabel.text = ""
    }
    
    func setHeightZero(){
        //kadarBagianIndividuLabel.isHidden = true
        jumlahAhliWarisIndividuLabel.isHidden = true
        xJumlahAhliWarisIndividuLabel.isHidden = true
        xKadarBagianIndividuLabel.isHidden = true
        kadarBagianBersekutuLabel.isHidden = true
        bagianAkhirBersekutuLabel.isHidden = true
        
        jumlahAhliWarisIndividuLabelConstrain.constant = 0
        kadarBagianIndividuLabelConstrain.constant = 0
        xJumlahAhliWarisIndividuLabelConstrain.constant = 0
        xKadarBagianIndividuLabelConstrain.constant = 0
        xKadarBagianIndividuLabelHeightConstrain.constant = 0
        viewTopConstrain.constant = 0
        kadarBagianBersekutuLabelHeightConstrain.constant = 0
        bagianAkhirBersekuTuLabelHeightConstrain.constant = 0
        kadarBagianBersekutuLabelHeightConstrain2.constant = 0
        bagianAkhirBersekuTuLabelHeightConstrain2.constant = 0
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
//
//    func printDetailInfo(){
//        print("")
//        print("Ahli waris dengan nama \(ahliWaris.nama)")
//        print("Jumlah ashabah laki adalah = \(jumlahLakiAshabah)")
//        print("Jumlah ashabah perempuan adalah = \(jumlahPerempuanAshabah)")
//        print("Total ashabah  adalah = \(totalJumlahAshabah)")
//        print("Apakah ada ashabah jamak = \(ashabahJamak)")
//    }
    
    func setDalil(){
        let dalilInCoreData = CoreDataObject.shared.allObjectInCoreData
        
        for dalilAhliWaris in ahliWaris.tag {
            for dalil in dalilInCoreData {
                if dalilAhliWaris == dalil.tag {
                    dalilSelected.append(dalil)
                }
            }
        }
    }
}
