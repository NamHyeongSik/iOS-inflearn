//
//  InstanceDetailViewController.swift
//  PassData
//
//  Created by HYEONG SIK NAM on 2022/03/13.
//

import UIKit

class InstanceDetailViewController: UIViewController {

    var mainVC: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func sendDataMainVC(_ sender: Any) {
        mainVC?.dataLabel.text = "some data"
        self.dismiss(animated: true, completion: nil)
    }
}
