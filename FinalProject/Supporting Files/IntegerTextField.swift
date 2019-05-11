//
//  IntegerTextField.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 4/14/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class IntegerTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.keyboardType = .numberPad
    }
}
