//
//  ViewController.swift
//  Navigation_Master
//
//  Created by HYEONG SIK NAM on 2022/04/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNaviTitleImage()
        self.makeBackButton()
        makeRightAlarmButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.naviBackgroundDesign()
    }
    
    func makeRightAlarmButton() {
//        let image = UIImage(systemName: "alarm")?.withRenderingMode(.alwaysOriginal)
//
//        let rightItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(rightItemClick))
        
        //systemName을 사용하면 이 configuration을 이용하여 이미지 크기 조절이 가능
        let config = UIImage.SymbolConfiguration(pointSize: 40)
        
        let btn1 = UIButton()
        btn1.setImage(UIImage(systemName: "alarm", withConfiguration: config), for: .normal)
        btn1.addTarget(self, action: #selector(rightItemClick), for: .touchUpInside)
        
        let btn2 = UIButton()
        btn2.setImage(UIImage(systemName: "alarm.fill", withConfiguration: config)?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn2.addTarget(self, action: #selector(rightItemClick2), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [btn1, btn2])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        
        let customItem = UIBarButtonItem(customView: stackView)
        
        self.navigationItem.rightBarButtonItem = customItem
        
    }
    
    @objc func rightItemClick() {
        print("click1")
    }
    
    @objc func rightItemClick2() {
        print("click2")
    }
    
    func naviBackgroundDesign() {
        self.navigationController?.navigationBar.backgroundColor = .red
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        self.statusBar?.backgroundColor = .red
    }
    
    func makeBackButton() {
        
//        let backImage = UIImage(systemName: "backward.fill")?.withRenderingMode(.alwaysOriginal)
        
        guard let backImage = UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal) else {
            return
        }
        
        // 제일 좋은 방법은 디자이너에게 원하는 크기를 요구하고 그 크기대로 받는것.
        // 그러나 아래의 방법의 장점은 코드로 정확한 수치를 볼 수 있음
        let newImage = resizeImage(image: backImage, newWidth: 20, newHeight: 20)
        
        self.navigationController?.navigationBar.backIndicatorImage = newImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = newImage
        self.navigationController?.navigationBar.tintColor = .orange

        self.navigationItem.backButtonTitle = ""
        
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage? {
        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func setNaviTitleImage() {
        //        self.title = "Main"
                
        //        let logo = UIImageView(image: UIImage(named: "logo"))
        //        logo.contentMode = .scaleAspectFit
        //        logo.widthAnchor.constraint(equalToConstant: 90).isActive = true
        //        logo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //        navigationItem.titleView = logo
                
        let btn = UIButton()
//        btn.backgroundColor = .black
        btn.setTitle("Button", for: .normal)
        btn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
                
        btn.addTarget(self, action: #selector(testAction), for: .touchUpInside)
                
        self.navigationItem.titleView = btn
    }
    
    @objc func testAction() {
        print("push")
    }


}

