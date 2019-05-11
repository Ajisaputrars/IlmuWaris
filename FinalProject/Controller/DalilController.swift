//
//  DalilController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 31/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class DalilController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var ahliWaris = [Dalil]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "DalilViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "dalilViewCell")
        tableView.separatorStyle = .none
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setAhliWaris()
        self.title = "Lihat Dalil"
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setAhliWaris(){
        let string = "Cucu Perempuan"
        for i in CoreDataObject.shared.allObjectInCoreData {
            if i.ahliWaris == string {
                ahliWaris.append(i)
            }
        }
        
        func printAhliWaris(){
            print(string)
            for i in ahliWaris {
                print(i.tag!)
                print(i.bagian!)
            }
        }
        
        printAhliWaris()
    }
}

extension DalilController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ahliWarisDalil.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dalilViewCell") as! DalilViewCell
        cell.ahliWarisLabel.text = ahliWarisDalil[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ListDalilController(nibName: "ListDalilView", bundle: nil)
        controller.name = ahliWarisDalil[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
