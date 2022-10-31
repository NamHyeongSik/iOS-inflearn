//
//  ViewController.swift
//  PenGestureApp
//
//  Created by HYEONG SIK NAM on 2022/03/30.
//

import UIKit

enum Axis {
    case x
    case y
    case none
}

class ViewController: UIViewController {

    var dragAxis = Axis.none
    let myView = DraggableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        myView.center = self.view.center
        myView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        myView.backgroundColor = .red
        
        self.view.addSubview(myView)
    }

    @IBAction func selectPanType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            dragAxis = .x
        case 1:
            dragAxis = .y
        case 2:
            dragAxis = .none
        default:
            break
        }
        myView.dragAxis = self.dragAxis
    }
    
}

