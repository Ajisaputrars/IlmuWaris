//
//  IlmuWarisViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 16/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class IlmuWarisViewController: UIViewController {

    @IBOutlet weak var ilmuWarisTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ilmu Waris"
        
        let nib = UINib(nibName: "IlmuWarisTableViewCell", bundle: nil)
        ilmuWarisTableView.register(nib, forCellReuseIdentifier: "ilmuWarisViewCell")
        
        ilmuWarisTableView.dataSource = self
        ilmuWarisTableView.delegate = self
        self.ilmuWarisTableView.separatorStyle = .none
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
    }
}

extension IlmuWarisViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ilmuWarisDesc1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ilmuWarisViewCell") as! IlmuWarisViewCell
        let title = ilmuWarisTitle1[indexPath.row]
        let desc = ilmuWarisDesc1[indexPath.row]
        cell.ilmuWarisTitleLabel.text = title
        cell.ilmuWarisDescriptionLabel.text = desc
        cell.ilmuWarisImageView.image = UIImage(named: "Book")//"BookGroupedTransparen2")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Beware! Need more fix then
        let text = ilmuWarisTitle1[indexPath.row].replacingOccurrences(of: " ", with: "") + "View"
        print("TEXT = \(text)")
        if text == "AshabulFurudhView" {
            let controller = AshabulFurudhViewController(nibName: text, bundle: nil)
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DetailIlmuWarisViewController(nibName: text, bundle: nil)
            navigationController?.pushViewController(controller, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension IlmuWarisViewController {
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
