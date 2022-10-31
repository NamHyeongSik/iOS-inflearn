//
//  FloatingButtonListViewController.swift
//  Floating_Button
//
//  Created by HYEONG SIK NAM on 2022/04/25.
//

import UIKit

class FloatingButtonListViewController: UIViewController {
    
    @IBOutlet weak var btn1CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn2CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn3CenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1CenterY.constant = 0
        btn2CenterY.constant = 0
        btn3CenterY.constant = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        btn1CenterY.constant = 100
//        btn2CenterY.constant = 200
//        btn3CenterY.constant = 300
//
//        UIView.animate(withDuration: 0.4) {
//            self.view.layoutIfNeeded() => 화면 갱신
//        }
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.btn1CenterY.constant = 100
            self.btn2CenterY.constant = 200
            self.btn3CenterY.constant = 300
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @IBAction func dismissFloating(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.btn1CenterY.constant = 0
            self.btn2CenterY.constant = 0
            self.btn3CenterY.constant = 0
            self.view.layoutIfNeeded()
        }){ completion in
            // 애니메이션이 끝나는 시점
            self.dismiss(animated: false)
        }
    }
    

}
