//
//  ListDalilController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 31/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class ListDalilController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var name:String!
    
    var dalils = [Dalil]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ListDalilViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "listDalilViewCell")
        tableView.separatorStyle = .none
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)

        
        setTitle()
        setDalil()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTitle(){
        if name == "Saudara Kandung Perempuan" {
            self.title = "Saudara Kandung P."
        }
        
        else if name == "Saudara Kandung Laki-Laki" {
            self.title = "Saudara Kandung L."
        }
        
        else if name == "Saudara Seayah Perempuan" {
            self.title = "Saudara Seayah P."
        }
        
        else if name == "Saudara Seayah Laki-Laki" {
            self.title = "Saudara Seayah L."
        }
        
        else if name == "Anak Laki-Laki dari Saudara Kandung Laki-Laki" {
            self.title = "Anak Saudara Kandung"
        }
        
        else if name == "Anak Laki-Laki dari Saudara Seayah Laki-Laki" {
            self.title = "Anak Saudara Seayah"
        }
        
        else if name == "Anak Laki-Laki Paman Kandung" {
            self.title = "Anak Paman Kandung"
        }
        
        else if name == "Anak Laki-Laki Paman Sekakek" {
            self.title = "Anak Paman Sekakek"
        }
        
        else {
            self.title = name
        }
    }
    
    func setDalil(){
        for i in CoreDataObject.shared.allObjectInCoreData {
            if i.ahliWaris == self.name {
                dalils.append(i)
            }
        }
    }
}

extension ListDalilController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dalils.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listDalilViewCell") as! ListDalilViewCell
        cell.sumberDalilLabel.text = dalils[indexPath.row].sumberDalil!
        cell.bagianLabel.text = "Bagian: \(dalils[indexPath.row].bagian!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailDalilController(nibName: "DetailDalilView", bundle: nil)
        navigationController?.pushViewController(controller, animated: true)
        controller.dalil = self.dalils[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
