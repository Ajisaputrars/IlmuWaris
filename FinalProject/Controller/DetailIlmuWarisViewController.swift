//
//  DetailIlmuWarisViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 16/10/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class DetailIlmuWarisViewController: UIViewController {
    
    var titleName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (titleName == nil || titleName == "") {
            self.title = "Detail Ilmu Waris"
        } else {
            if titleName == "Suami" || titleName == "Istri" {
                self.title = "Detail Pasangan"
            } else {
                self.title = "Detail " + titleName
            }
        }

    }
}

extension DetailIlmuWarisViewController {
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
