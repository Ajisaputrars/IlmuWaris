//
//  InfoViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 5/3/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var headerHartaView: UIView!
    @IBOutlet weak var footerHartaView: UIView!
    @IBOutlet weak var hartaTotalView: UIView!
    @IBOutlet weak var wasiatView: UIView!
    @IBOutlet weak var pengurusanJenazahView: UIView!
    @IBOutlet weak var hutangView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var totalBagianLabel: UILabel!
    
    @IBOutlet weak var statusTotalBagianLabel: UILabel!
    @IBOutlet weak var statusTotalPembagianLabel: UILabel!
    @IBOutlet weak var ashabahLabel: UILabel!
    @IBOutlet weak var pokokMasalahLabel: UILabel!
    
    @IBOutlet weak var hartaTotalLabel: UILabel!
    @IBOutlet weak var hutangLabel: UILabel!
    @IBOutlet weak var wasiatLabel: UILabel!
    @IBOutlet weak var pengurusanJenazahLabel: UILabel!
    @IBOutlet weak var hartaBersihLabel: UILabel!
    
    
    var ahliWaris: [AhliWaris]!
    
    var hartaTotal: Double!
    var wasiat: Double!
    var pengurusanJenazah: Double!
    var hutang: Double!
    var hartaSiapBagi: Double!
    
    var ashabah: String!
    var statusAulRadd: Status!
    
    var totalBagian: Double!
    var totalBagianArray: String!
    var pokokAwal: Int!
    var pokokAkhir: Int!
    
    let heightForOneCell = 20
    var tableViewHeight = 0
    
    var numerator = 0
    var denumerator = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        hartaTotalLabel.text = (String(Int(hartaTotal))).toRupiahCurrency
        hutangLabel.text = (String(Int(hutang))).toRupiahCurrency
        wasiatLabel.text = (String(Int(wasiat))).toRupiahCurrency
        pengurusanJenazahLabel.text = (String(Int(pengurusanJenazah))).toRupiahCurrency
        hartaBersihLabel.text = (String(Int(hartaSiapBagi))).toRupiahCurrency
        
        let ahliWarisCount = ahliWaris.count
        tableViewHeight = heightForOneCell * ahliWarisCount
        self.title = "Detail Pembagian"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableViewHeightConstraint.constant = CGFloat(tableViewHeight)
        sumTotalBagian()
        setDetailInformation()
    }
    
    func sumTotalBagian(){
        var totalBagian = rationalApproximationOf(x0: 0)
        var bagianArray = [Rational]()
        for i in ahliWaris {
            let bagian = i.rationalBagianAwal
            if i.bagianAwal <= 1 {
                bagianArray.append(bagian)
            }
        }
        for i in bagianArray {
            totalBagian = addRational(first: totalBagian, second: i)
        }
        numerator = totalBagian.num
        denumerator = totalBagian.den
        totalBagianLabel.text = "\(totalBagian.num)/\(totalBagian.den)"
        print("Status pembagian adalah = \(self.statusAulRadd)")
        print("Ashabah adalah = \(ashabah)")
    }
    
    func setDetailInformation(){
        var str = ""
        var aulRaddStr = ""
        var pokokStr = ""
        var ashabahStr = ""
        
        if numerator < denumerator {
            str = "Kurang dari satu"
        } else if numerator > denumerator {
            str = "Lebih dari satu"
        } else {
            str = "Tepat satu"
        }
        
        statusTotalBagianLabel.text = str
        
        if pokokAwal < pokokAkhir {
            aulRaddStr = "Aul"
        } else if pokokAwal > pokokAkhir {
            aulRaddStr = "Radd"
        } else {
            aulRaddStr = "Tak ada Aul / Radd"
        }
        
        statusTotalPembagianLabel.text = aulRaddStr
        
        pokokStr = "Awal = \(pokokAwal!) | Akhir = \(pokokAkhir!)"
        pokokMasalahLabel.text = pokokStr
        
        ashabahLabel.text = ashabah
    }
}

extension InfoViewController {
    
    func setupData(){
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FinalAhliWarisCell
        let finalAhliWaris = ahliWaris[indexPath.row]
        cell.configureCell(ahliWaris: finalAhliWaris)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ahliWaris.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(heightForOneCell)
    }
    
    func printData(){
        print("")
        print("Informasi dari InfoViewController")
        
        let a = rationalApproximationOf(x0: totalBagian)

        print("Harta Total adalah = \(hartaTotal!)")
        print("Wasiat Total adalah = \(wasiat!)")
        print("Pengurusan Jenazah  adalah = \(pengurusanJenazah!)")
        print("Hutang  adalah = \(hutang!)")
        print("Harta siap bagi  adalah = \(hartaSiapBagi!)")
        print("Ada ashabah? = \(ashabah!)")
        print("Status pembagian adalah = \(statusAulRadd!)")
        print("Total bagian  adalah = \(a.num)/\(a.den)")
        print("Pokok awal  adalah = \(pokokAwal!)")
        print("Pokok akhir adalah = \(pokokAkhir!)")
        
        var rat = rationalApproximationOf(x0: 0)
        
        for i in ahliWaris {
            let bagianAwal = rationalApproximationOf(x0: i.bagianAwal)
            
            if i.bagianAwal <= 1 {
                print("Ahli Waris = \(i.nama) dengan bagian = \(bagianAwal.num)/\(bagianAwal.den)")
                rat = addRational(first: rat, second: bagianAwal)
            } else {
                var str = ""
                if i.bagianAwal == 2 {
                    str = "A(2)"
                } else {
                    str = "A(3)"
                }
                
                print("Ahli Waris = \(i.nama) dengan bagian = \(str)")
            }
        }
    }
}
