//
//  DraggableView.swift
//  PenGestureApp
//
//  Created by HYEONG SIK NAM on 2022/03/30.
//

import UIKit

class DraggableView: UIView {
    
    var dragAxis = Axis.none
    
    init() {
        super.init(frame: CGRect.zero)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
        
        // UI로 만드는 것을 금지하게 만듬
//        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dragging(pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            print("begin")
        case .changed:
            let delta = pan.translation(in: self.superview)
            var myPosition = self.center
            
            if dragAxis == .x {
                myPosition.x += delta.x
            } else if dragAxis == .y {
                myPosition.y += delta.y
            } else {
                myPosition.x += delta.x
                myPosition.y += delta.y
            }
            
            self.center = myPosition
            //다시 초기화
            pan.setTranslation(CGPoint.zero, in: self.superview)
            
        case .ended, .cancelled:
            if self.frame.minX < 0 {
                self.frame.origin.x = 0
            }
            if let hasSuperView = self.superview {
                if self.frame.maxX > hasSuperView.frame.maxX {
                    self.frame.origin.x = hasSuperView.frame.maxX - self.bounds.width
                }
            }
        default:
            break
        }
    }
    
}
