//
//  AshabulFurudhViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 17/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class AshabulFurudhViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ashabul Furudh"
        
        let nib = UINib(nibName: "AshabulFurudhViewCell", bundle: nil) 
        tableView.register(nib, forCellReuseIdentifier: "ashabulFurudhCell")
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AshabulFurudhViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ashabulFurudhCell") as! AshabulFurudhTableViewCell
        let title = ashabulFurudhTitle[indexPath.row]
        let desc = ashabulFurudhDesc[indexPath.row]
        cell.titleLabel.text = title
        cell.descLabel.text = desc
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ashabulFurudhTitle.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = ashabulFurudhTitle[indexPath.row].replacingOccurrences(of: " ", with: "") + "View"
        let controller = DetailIlmuWarisViewController(nibName: text, bundle: nil)
        navigationController?.pushViewController(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AshabulFurudhViewController {
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
