//
//  NotiDetailViewController.swift
//  PassData
//
//  Created by HYEONG SIK NAM on 2022/03/16.
//

import UIKit

class NotiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func notificationAction(_ sender: Any) {
        let notificationName = Notification.Name("sendSomeData")
        
        let strDic = ["str" : "noti string"]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: strDic)
        
        dismiss(animated: true, completion: nil)
    }
}
