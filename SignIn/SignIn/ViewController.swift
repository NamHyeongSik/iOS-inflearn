//
//  ViewController.swift
//  SignIn
//
//  Created by HYEONG SIK NAM on 2022/04/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    var emailErrorHeight: NSLayoutConstraint!
    var passwordErrorHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)

        emailErrorHeight = emailError.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorHeight = passwordError.heightAnchor.constraint(equalToConstant: 0)
        
    }
    
    @objc func textFieldEdited(textField: UITextField) {
        if textField == emailTextField {
            if isValidEmail(email: emailTextField.text) {
                emailErrorHeight.isActive = true
            } else {
                emailErrorHeight.isActive = false
            }
        } else {
            if isValidPassword(password: passwordTextField.text) {
                passwordErrorHeight.isActive = true
            } else {
                passwordErrorHeight.isActive = false
            }
        }
        
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func isValidEmail(email: String?) -> Bool {
        guard email != nil else { return false }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: email)
    }
    
    func isValidPassword(password: String?) -> Bool {
        if let pwd = password {
            if pwd.count < 8 {
                return false
            }
        }
        return true
    }

}

