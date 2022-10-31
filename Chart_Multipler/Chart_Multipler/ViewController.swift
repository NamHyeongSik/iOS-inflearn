//
//  ViewController.swift
//  Chart_Multipler
//
//  Created by HYEONG SIK NAM on 2022/04/26.
//

import UIKit


extension NSLayoutConstraint {
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint {
        //deactivate & activate가 없으면 설정이 계속 누적됨.
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var graph1Height: NSLayoutConstraint!
    @IBOutlet weak var graph2Height: NSLayoutConstraint!
    @IBOutlet weak var graph3Height: NSLayoutConstraint!
    @IBOutlet weak var graph4Height: NSLayoutConstraint!
    
    @IBAction func changeGraph(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            graph1Height = graph1Height.changeMultiplier(value: 0.25)
            graph2Height = graph2Height.changeMultiplier(value: 0.5)
            graph3Height = graph3Height.changeMultiplier(value: 0.75)
            graph4Height = graph4Height.changeMultiplier(value: 1)
        } else {
            graph1Height = graph1Height.changeMultiplier(value: 1)
            graph2Height = graph2Height.changeMultiplier(value: 0.75)
            graph3Height = graph3Height.changeMultiplier(value: 0.5)
            graph4Height = graph4Height.changeMultiplier(value: 0.25)
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

