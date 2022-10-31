//
//  MyIDViewController.swift
//  Setting_Clone_App
//
//  Created by HYEONG SIK NAM on 2022/03/28.
//

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func doCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        textFieldDidChange(sender: emailTextField)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        if sender.text?.isEmpty == true {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
}
