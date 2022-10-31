//
//  ViewController.swift
//  OnboardingViewApp
//
//  Created by HYEONG SIK NAM on 2022/03/30.
//

import UIKit

class ViewController: UIViewController {

    var didShowOnboardingView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if didShowOnboardingView == false {
            didShowOnboardingView = true
            let pageVC = OnboardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
            pageVC.modalPresentationStyle = .fullScreen
            self.present(pageVC, animated: true)
        }
        
    }

}

