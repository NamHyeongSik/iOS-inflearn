//
//  ClosureDetailViewController.swift
//  PassData
//
//  Created by HYEONG SIK NAM on 2022/03/16.
//

import UIKit

class ClosureDetailViewController: UIViewController {

//    let myClosure: () ->  Void = {}
    var myClosure: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func closurePassData(_ sender: Any) {
        myClosure?("Closure String")
        dismiss(animated: true, completion: nil)
    }
}
