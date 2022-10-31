//
//  ViewController.swift
//  Custom_keyboard
//
//  Created by HYEONG SIK NAM on 2022/04/24.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {
    func rearrange(btns: [UIButton?]) {
        let shuffledButtons = btns.shuffled()
        btns.enumerated().forEach { (index, btn) in
            btns[index]?.setTitle(shuffledButtons[index]?.titleLabel?.text, for: .normal)
        }
    }
    
    func keyboardTapped(str: String) {
        let oldNumber = Int(firstTextFiled.text!)
        var newNumber = Int(str)
        
        if oldNumber != nil && str == "00" {
            newNumber = oldNumber! * 100
        }
        if oldNumber != nil && str == "000" {
            newNumber = oldNumber! * 1000
        }
        if let hasNumber = newNumber {
            firstTextFiled.text = hasNumber.description
        }
    }



    @IBOutlet weak var firstTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let myKeyboard = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        let myKeyboardView = myKeyboard?.first as! CustomKeyboard
        
        myKeyboardView.delegate = self
        
        firstTextFiled.inputView = myKeyboardView
    }


}

