//
//  SegueDetailViewController.swift
//  PassData
//
//  Created by HYEONG SIK NAM on 2022/03/13.
//

import UIKit

class SegueDetailViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    var dataString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLabel.text = dataString
        // Do any additional setup after loading the view.
    }

}
