//
//  ViewController.swift
//  Calculation
//
//  Created by HYEONG SIK NAM on 2022/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var btn10: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.layer.cornerRadius = 50
        resultLabel.layer.masksToBounds = true
        // == resultLabel.clipsToBounds = true
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        btn1.layer.cornerRadius = btn1.bounds.width / 2
        btn10.layer.cornerRadius = btn10.bounds.height / 2
    }

}

