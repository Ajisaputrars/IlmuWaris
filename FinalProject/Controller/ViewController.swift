//
//  ViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 1/25/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = CoreDataObject.shared.allObjectInCoreData
        self.title = "Aplikasi Ilmu Waris"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @IBAction func toAboutPage(_ sender: UIButton) {
        let aboutViewController = AboutPageViewController(nibName: "AboutPageView", bundle: nil)
        self.navigationController?.pushViewController(aboutViewController, animated: true)
    }
    
    @IBAction func toIlmuWarisPage(_ sender: Any) {
        let aboutViewController = IlmuWarisViewController(nibName: "IlmuWarisView", bundle: nil)
        self.navigationController?.pushViewController(aboutViewController, animated: true)
    }
    
    @IBAction func toLihatDalilPage(_ sender: Any) {
        let aboutViewController = DalilController(nibName: "DalilView", bundle: nil)
        self.navigationController?.pushViewController(aboutViewController, animated: true)
    }
}
