//
//  OnboardingItemViewController.swift
//  OnboardingViewApp
//
//  Created by HYEONG SIK NAM on 2022/03/30.
//

import UIKit

class OnboardingItemViewController: UIViewController {

    var topImage: UIImage? = UIImage()
    var mainText = ""
    var subText = ""
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = .systemFont(ofSize: 20, weight: .medium)
        }
    }
    @IBOutlet private weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = .systemFont(ofSize: 14, weight: .light)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = topImage
        titleLabel.text = mainText
        descriptionLabel.text = subText
    }

}
