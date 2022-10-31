//
//  DelegateDetailViewController.swift
//  PassData
//
//  Created by HYEONG SIK NAM on 2022/03/16.
//

import UIKit

protocol DelegateDetailViewControllerDelegate: AnyObject {
    func passString(string: String)
}

class DelegateDetailViewController: UIViewController {

    weak var delegate: DelegateDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func passDataToMainVC(_ sender: Any) {
        delegate?.passString(string: "Delegate Pass Data")
        self.dismiss(animated: true, completion: nil)
    }
    
}
