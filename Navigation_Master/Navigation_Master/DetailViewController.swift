//
//  DetailViewController.swift
//  Navigation_Master
//
//  Created by HYEONG SIK NAM on 2022/04/11.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .orange

        self.statusBar?.backgroundColor = .orange
    }
}

extension UIViewController {
    var statusBar: UIView? {
        //status bar design
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        
        let window = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
        
        if let hasStatus = sceneDelegate?.statusBarView {
//            self.view.addSubview(hasStatus) -> 이러면 상세 뷰에서는 적용안됨. 그래서 window에 올리는 거임.
            window?.addSubview(hasStatus)
        }
        
        return sceneDelegate?.statusBarView
    }
}
