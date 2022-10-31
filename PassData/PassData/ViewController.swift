//
//  ViewController.swift
//  PassData
//
//  Created by HYEONG SIK NAM on 2022/03/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationName = Notification.Name("sendSomeData")
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeData), name: notificationName, object: nil)
    }
    
    @objc func showSomeData(notification: Notification) {
        if let str = notification.userInfo?["str"] as? String {
            self.dataLabel.text = str
        }
    }
    
    @IBOutlet weak var dataLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" {
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "Hi"
            }
        }
    }
    

    @IBAction func moveToDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detailVC.someString = "some String!"
        
        self.present(detailVC, animated: true, completion: nil)
        
        detailVC.someLabel.text = "some Label!"
    }
    
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        
        detailVC.mainVC = self
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToClosure(_ sender: Any) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        detailVC.myClosure = { str in
            self.dataLabel.text = str
        }
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToNotification(_ sender: Any) {
        let detailVC = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        self.present(detailVC, animated: true, completion: nil)
    }
}

extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLabel.text = string
    }
}
