//
//  HasilViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 4/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class HasilViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hartaBersihLabel: UILabel!
    @IBOutlet weak var pokokMasalahLabel: UILabel!
    @IBOutlet weak var bagianTableHeaderLabel: UILabel!
    @IBOutlet weak var statusPembagianLabel: UILabel!
    @IBOutlet weak var pokokMasalahAkhirLabel: UILabel!
    
    //Gender
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
    
    
    //Hitung Bagian Ashabul Furud
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
    
    var statusBagianHarga: Status!
    
    //Harta dan Bagian
    var hartaSiapBagi = 0.0
    var hartaSisa = 0.0
    var totalBagian = 0.0
    var hartaKotor = 0.0
    var pengurusanJenazah = 0.0
    var hutang = 0.0
    var wasiat = 0.0
    
    //Pokok Awal dan Akhir
    var pokokMasalahAwal = 0
    var pokokMasalahAkhir = 0
    
    var ahliWaris = [AhliWaris]()
    var ahliWarisForInfo = [AhliWaris]()
    
    var selectedAhliWaris: AhliWaris!
    var ahliWarisAshabah = ""
    
    var jumlahLakiAshabah = 0
    var jumlahPerempuanAshabah = 0
    var totalJumlahAshabah = 0
    var ashabahJamak = false
    
    var statusSudahHabis = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        tableView.delegate = self
        tableView.dataSource = self
        
        if pokokMasalahAwal == pokokMasalahAkhir {
            pokokMasalahLabel.text = "\(pokokMasalahAwal)"
            pokokMasalahAkhirLabel.text = "\(pokokMasalahAkhir)"
        } else {
            pokokMasalahLabel.text = "\(pokokMasalahAwal)"
            pokokMasalahAkhirLabel.text = "\(pokokMasalahAkhir)"
        }
        
        if pokokMasalahAwal > pokokMasalahAkhir {
            statusPembagianLabel.text = "Radd"
        } else if pokokMasalahAwal < pokokMasalahAkhir {
            statusPembagianLabel.text = "Aul"
        } else {
            statusPembagianLabel.text = "Tak Ada Aul/Radd"
        }
        
        hartaBersihLabel.text = "\(hartaSiapBagi)".toRupiahCurrency
        bagianTableHeaderLabel.layer.addBorder(edge: .left, color: UIColor.white, thickness: 1)
        bagianTableHeaderLabel.layer.addBorder(edge: .right, color: UIColor.white, thickness: 1)

        setAhliWarisForInfo()
        
        self.title = "Hasil Pembagian Warisan"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        whoIsAshabah()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        let selectedRow: IndexPath? = tableView.indexPathForSelectedRow
        if let selectedRowNotNill = selectedRow {
            tableView.deselectRow(at: selectedRowNotNill, animated: true)
        }
    }
    
    @IBAction func backToStart(_ sender: UIButton) {
        let alert = UIAlertController(title: "Reset", message: "Yakin ingin keluar dari hasil perhitungan ini dan mulai perhitungan baru?", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (_) in
            self.backToHitung()
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        let alert = UIAlertController(title: "Back to Home", message: "Yakin ingin kembali ke halaman awal aplikasi?", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (_) in
            self.backToHome()
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func backToHitung(){
        let allViewController = Array(self.navigationController!.viewControllers)
        for aViewController in allViewController {
            let vc = aViewController.isKind(of: HartaViewController.classForCoder())
            if (vc){
                self.navigationController?.popToViewController(aViewController, animated: true)
            }
        }
        isResetButtonPressed = true
    }
    
    func backToHome(){
        let allViewController = Array(self.navigationController!.viewControllers)
        for aViewController in allViewController {
            if (aViewController.isKind(of: ViewController.classForCoder())){
                self.navigationController?.popToViewController(aViewController, animated: true)
            }
        }
    }
    
    func setAhliWarisForInfo(){
        for i in ahliWaris {
            //Untuk Nenek
            let jumlahNenek = jumlahNenekDariIbu + jumlahNenekDariAyah
            
            //Untuk Saudara Seibu
            var bagianSaudaraSeibu = 0.0
            let jumlahSaudaraSeibu = jumlahSaudaraSeibuLaki + jumlahSaudaraSeibuPerempuan
            
            if jumlahSaudaraSeibu <= 0 {
                bagianSaudaraSeibu = 0
            } else if jumlahSaudaraSeibu == 1 {
                bagianSaudaraSeibu = 1/6
            } else if jumlahSaudaraSeibu > 1 {
                bagianSaudaraSeibu = 1/3
            }
            
            if i.nama == "Nenek dari Ayah" {
                let ahli = AhliWaris(nama: "Nenek", bagian: 1/6, jumlah: jumlahNenek, harta: 0 )
                ahliWarisForInfo.append(ahli)
            } else if i.nama == "Nenek dari Ibu" {
                let ahli = AhliWaris(nama: "Nenek", bagian: 1/6, jumlah: jumlahNenek, harta: 0 )
                for i in ahliWarisForInfo {
                    if i.nama == "Nenek" {
                        ahliWarisForInfo.removeLast()
                    }
                }
                ahliWarisForInfo.append(ahli)
            } else if i.nama == "Saudara Seibu Laki-laki" {
                let ahli = AhliWaris(nama: "Saudara Seibu", bagian: bagianSaudaraSeibu, jumlah: jumlahSaudaraSeibu, harta: 0 )
                ahliWarisForInfo.append(ahli)
            } else if i.nama == "Saudara Seibu Perempuan" {
                let ahli = AhliWaris(nama: "Saudara Seibu", bagian: bagianSaudaraSeibu, jumlah: jumlahSaudaraSeibu, harta: 0 )
                for i in ahliWarisForInfo {
                    if i.nama == "Saudara Seibu" {
                        ahliWarisForInfo.removeLast()
                    }
                }
                ahliWarisForInfo.append(ahli)
            } else {
                ahliWarisForInfo.append(i)
            }
        }
        
        for l in ahliWarisForInfo {
            let bagian = rationalApproximationOf(x0: l.bagianAwal)
            let bagianStringzz = "\(bagian.num)/\(bagian.den)"
            print("Nama = \(l.nama), Jumlah = \(l.jumlahAhliWaris), bagian = \(bagianStringzz)")
        }
    }
}

extension HasilViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HasilWarisCell") as! AhliWarisCell
        let i = ahliWaris[indexPath.row]
        cell.selectionStyle = .default
        cell.configureCell(ahliWaris: i)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ahliWaris.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ahliWaris.count == 1 {
            let a = ahliWaris[0]
            if a.nama == "Baitul Mal" {
                let alert = UIAlertController(title: "Baitul Mal", message: "Karena tidak ada ahli waris yang dipilih, maka seluruh harta masuk ke Baitul Mal", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (_) in
                    
                }
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else { //if a.nama == "Suami" || a.nama == "Istri" {
                selectedAhliWaris = ahliWaris[indexPath.row]
                performSegue(withIdentifier: "toDetailViewController", sender: nil)
//                let num = a.rationalBagianAwal.num
//                let den = a.rationalBagianAwal.den
////                print("Bagian awal adalah = \(ahliWaris[0].bagianAwal)")
//
//                var message = "Bagian \(a.nama) secara fardh sebesar \(num)/\(den), namun dalam perhitungan ini \(a.nama) menguasai seluruh harta karena tak ada ahli waris lain selain dirinya "
//                if a.nama == "Istri" {
//                    message += "dan dibagi secara merata ke masing-masing Istri"
//                }
//
//                let alert = UIAlertController(title: a.nama, message: message, preferredStyle: .alert)
//                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (_) in
//
//                }
//
//                alert.addAction(okButton)
//                self.present(alert, animated: true, completion: nil)
            }
        } else {
            selectedAhliWaris = ahliWaris[indexPath.row]
            performSegue(withIdentifier: "toDetailViewController", sender: nil)
        }
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        let row = tableView.cellForRow(at: indexPath)
        let cellHeight = (row?.bounds.height)!
        let cellWidth = (row?.bounds.width)!
        let selectedAhliWarisNama = ahliWaris[indexPath.row].nama
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rem = indexPath.row % 2
        if (rem == 0) {
            
        } else {
            cell.backgroundColor = UIColor(red: 240/255, green: 255/255, blue: 240/255, alpha: 1)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? InfoViewController {
            //hartanya masih kurang nich
            destination.hartaSiapBagi = self.hartaSiapBagi
            
            destination.ashabah = self.ahliWarisAshabah
            destination.statusAulRadd = self.statusBagianHarga
            destination.totalBagian = self.totalBagian
            destination.pokokAwal = self.pokokMasalahAwal
            destination.pokokAkhir = self.pokokMasalahAkhir
            destination.ahliWaris = self.ahliWarisForInfo
            
            destination.hartaTotal = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
        if let destination = segue.destination as? DetailViewController {
            destination.ahliWaris = self.selectedAhliWaris
            destination.statusOf = self.statusBagianHarga
            destination.pokokMasalahAwal = self.pokokMasalahAwal
            destination.pokokMasalahAkhir = self.pokokMasalahAkhir
            destination.ahliWarisArray = self.ahliWarisForInfo
            destination.hartaSisa = self.hartaSisa
            destination.hartaSiapBagi = self.hartaSiapBagi
            
            destination.jumlahLakiAshabah = self.jumlahLakiAshabah
            destination.jumlahPerempuanAshabah = self.jumlahPerempuanAshabah
            destination.totalJumlahAshabah =  self.totalJumlahAshabah
            destination.ashabahJamak = self.ashabahJamak
        }
    }
    
    func printAhliWaris(){
        print("")
        print("Ahli waris yang ada adalah sebagai berikut: ")
        for i in ahliWaris {
            let a = i.harta
            var b = ""
            if a <= 0 {
                b = "Habis"
            } else {
                b = String(a)
            }
            print("Nama = \(i.nama) , bagian = \(i.bagianWarisan), harta = \(b)")
        }
    }
}
