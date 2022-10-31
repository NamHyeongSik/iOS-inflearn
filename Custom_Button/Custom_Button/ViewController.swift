//
//  ViewController.swift
//  Custom_Button
//
//  Created by HYEONG SIK NAM on 2022/04/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customButton: RotateButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이제 이벤트를 등록했으니 반복적인 코드를 사용할 필요가 없음.
        customButton.selectTypeCallback = { upDownType in
            print(upDownType)
            if upDownType == .down {
                
            } else {
                
            }
            
        }
        
//        let myButton = RotateButton()
//
//        self.view.addSubview(myButton)
//
//        myButton.translatesAutoresizingMaskIntoConstraints = false
//
//        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//
//        myButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        myButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//        myButton.backgroundColor = .orange
//        myButton.setTitle("orange button", for: .normal)
//        myButton.setImage(UIImage(systemName: "arrow.up.circle"), for: .normal)
        
    }


}

