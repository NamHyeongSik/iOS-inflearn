//
//  ViewController.swift
//  Popup_Complex
//
//  Created by HYEONG SIK NAM on 2022/04/26.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showPopup(_ sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "PopupViewController", bundle: nil)
        
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "popupVC")
        
        popupVC.modalPresentationStyle = .overCurrentContext
        
        self.present(popupVC, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

