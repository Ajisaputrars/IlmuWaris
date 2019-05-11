//
//  HartaViewController.swift
//  FinalProject
//
//  Created by Aji Saputra Raka Siwi on 2/12/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class HartaViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var hartaTextField: UITextField!
    @IBOutlet weak var hutangTextField: UITextField!
    @IBOutlet weak var wasiatTextField: UITextField!
    @IBOutlet weak var pengurusanJenazahTextField: UITextField!
    @IBOutlet weak var hartaBersihInvalidLabel: UILabel!
    @IBOutlet weak var hartaBelumDimasukkanLabel: UILabel!

    var hartaSiapBagi = 0.0
    
    var hartaKotor: Double {
        if hartaTextField.text == "" {
            return 0
        }
        return Double(hartaTextField.text!)!
    }
    
    var hutang: Double {
        if hutangTextField.text == "" {
            return 0
        }
        return Double(hutangTextField.text!)!
    }
    
    var wasiat: Double {
        if wasiatTextField.text == "" {
            return 0
        }
        return Double(wasiatTextField.text!)!
    }
    
    var pengurusanJenazah: Double {
        if pengurusanJenazahTextField.text == "" {
            return 0
        }
        return Double(pengurusanJenazahTextField.text!)!
    }
    
    var activeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hartaBersihInvalidLabel.isHidden = true
        hartaBelumDimasukkanLabel.isHidden = true
        
        hartaTextField.delegate = self
        hutangTextField.delegate = self
        pengurusanJenazahTextField.delegate = self
        wasiatTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if isResetButtonPressed == true {
            hartaTextField.text = ""
            hutangTextField.text = ""
            pengurusanJenazahTextField.text = ""
            wasiatTextField.text = ""
            
            isResetButtonPressed = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hartaBersihInvalidLabel.isHidden = true
        hartaBelumDimasukkanLabel.isHidden = true
    }
    
    @objc func keyboardDidShow(notification: Notification) {
        let info:NSDictionary = notification.userInfo! as NSDictionary
        
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        
        let keyboardY = self.view.frame.size.height - keyboardSize.height
        
        let editingTextFieldY: CGFloat! = (self.activeTextField?.frame.origin.y)
        
        let keyboardOffset = keyboardY - 90
        
        if self.view.frame.origin.y >= 0 {
            if editingTextFieldY > keyboardOffset {
                UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.view.frame = CGRect(x: 0, y: self.view.frame.origin.y - (editingTextFieldY! - (keyboardOffset)), width: self.view.bounds.width, height: self.view.bounds.height)
                }, completion: nil)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        }, completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    func cekHartaBersih() -> Bool {
        
        let penguranganHargaKotor =  wasiat + hutang + pengurusanJenazah
        let hartaBersih = hartaKotor - penguranganHargaKotor
        let wasiatMaksimal = hartaKotor / 3
        
        if wasiat > wasiatMaksimal {
            print("Wasiatnya kebanyakan.....!!")
            hartaBersihInvalidLabel.isHidden = false
            hartaBersihInvalidLabel.text = "Wasiatnya lebih dari 1/3 harta"
            return false
        }
        
        if hartaBersih < 0 {
            print("Salah Besar! Masa negatif sih? Hehe")
            hartaBersihInvalidLabel.isHidden = false
            hartaBersihInvalidLabel.text = "Hasil minus! Tidak ada harta yang bisa dibagikan"
            return false
        }
        
        if hartaTextField.text == "" {
            hartaBelumDimasukkanLabel.isHidden = false
            hartaBelumDimasukkanLabel.text = "Hartanya belum dimasukkan!"
            return false
        }
        
        hartaSiapBagi = hartaBersih
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GenderViewController {
            destination.hartaSiapBagi = hartaSiapBagi
            
            destination.hartaKotor = self.hartaKotor
            destination.pengurusanJenazah =  self.pengurusanJenazah
            destination.hutang = self.hutang
            destination.wasiat = self.wasiat
        }
    }
    
    @IBAction func buttonNextPressed(_ sender: Any) {
        hartaBelumDimasukkanLabel.isHidden = true
        hartaBersihInvalidLabel.isHidden = true
        
        if (cekHartaBersih()){
            performSegue(withIdentifier: "hartaSegue", sender: nil)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch string {
        case "0","1","2","3","4","5","6","7","8","9":
            return true
        case ".":
            let array = Array(textField.text!)
            var decimalCount = 0
            for character in array {
                if character == "." {
                    decimalCount = decimalCount + 1
                }
            }
            
            if decimalCount == 1 {
                return false
            } else {
                return true
            }
        default:
            let array = Array(string)
            if array.count == 0 {
                return true
            }
            return false
        }
    }
}
