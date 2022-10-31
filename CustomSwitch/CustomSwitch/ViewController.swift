//
//  ViewController.swift
//  CustomSwitch
//
//  Created by HYEONG SIK NAM on 2022/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchBG: UIView!
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var buttonCenterX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchButton.layer.cornerRadius = switchButton.bounds.height / 2
        switchBG.layer.cornerRadius = switchBG.bounds.height / 2
        
    }

    @IBAction func selectedButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            if self.buttonCenterX.constant == 75 {
                self.buttonCenterX.constant = -75
                self.switchButton.backgroundColor = .orange
            } else {
                self.buttonCenterX.constant = 75
                self.switchButton.backgroundColor = .cyan
            }
            self.view.layoutIfNeeded()
        }
    }
    
}

