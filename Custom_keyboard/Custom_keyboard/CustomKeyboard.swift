//
//  CustomKeyboard.swift
//  Custom_keyboard
//
//  Created by HYEONG SIK NAM on 2022/04/24.
//

import UIKit

protocol CustomKeyboardDelegate {
    func keyboardTapped(str: String)
    func rearrange(btns: [UIButton?])
}

class CustomKeyboard: UIView {

    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn00: UIButton!
    @IBOutlet weak var btn000: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    var delegate: CustomKeyboardDelegate?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let allButtons = [btn0, btn00, btn000,
                          btn1, btn2, btn3,
                          btn4, btn5, btn6,
                          btn7, btn8, btn9]
        delegate?.keyboardTapped(str: sender.titleLabel!.text!)
        delegate?.rearrange(btns: allButtons)
        
        reloadInputViews()
    }
    
}
