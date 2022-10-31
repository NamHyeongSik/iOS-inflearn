//
//  ViewController.swift
//  First_APP
//
//  Created by HYEONG SIK NAM on 2022/03/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testButton: UIButton!
    @IBAction func doSomething(_ sender: Any) {
        
        testButton.backgroundColor = .blue
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(identifier: "DetailVC") as DetailVC
        
        self.present(detailVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        testButton.backgroundColor = .orange
    }


}

