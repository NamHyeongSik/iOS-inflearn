//
//  DetailViewController.swift
//  PassData
//
//  Created by HYEONG SIK NAM on 2022/03/13.
//

import UIKit

class DetailViewController: UIViewController {

    var someString = ""
    
    @IBOutlet weak var someLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        someLabel.text = someString
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
