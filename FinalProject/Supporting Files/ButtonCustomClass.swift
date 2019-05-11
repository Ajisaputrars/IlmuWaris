//
//  ButtonCustomClass.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 2/12/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonCustomClass: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setAllSettings()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setAllSettings()
    }
    
    public var color:CGColor = UIColor(red: 0 / 255.0, green: 127 / 255.0, blue: 0 / 255.0, alpha: 1).cgColor
    
    func setAllSettings(){
        self.backgroundColor = UIColor(cgColor: color)
        self.frame.size.height = 45.0
        self.layer.cornerRadius = 10
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitle("Lanjut", for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        self.titleLabel?.text = "Lanjut"
        
        self.setNeedsDisplay()
    }
    
    //    @IBInspectable
    //    public var colorBackground: UIColor = UIColor(red: 0 / 255.0, green: 127 / 255.0, blue: 0 / 255.0, alpha: 1) {
    //        didSet {
    //            self.backgroundColor = UIColor(cgColor: color)
    //        }
    //    }
    //    @IBInspectable
    //    public var textColor: UIColor = UIColor.white {
    //        didSet {
    //            self.setTitleColor(textColor, for: .normal)
    //        }
    //    }
    //
    //    @IBInspectable
    //    public var textInButton: String = "Lanjutkan" {
    //        didSet {
    //            self.titleLabel?.text = textInButton
    //        }
    //    }
    //
    //    @IBInspectable
    //    public var cornerRadiusButton: CGFloat = CGFloat(10.0) {
    //        didSet {
    //            self.layer.cornerRadius = CGFloat(cornerRadiusButton)
    //        }
    //    }
    //
    //    @IBInspectable
    //    public var textSizeButton: CGFloat = 20 {
    //        didSet {
    //            self.titleLabel?.font = UIFont.systemFont(ofSize: textSizeButton)
    //        }
    //    }
    
}
