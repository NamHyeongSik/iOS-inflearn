//
//  RotateButton.swift
//  Custom_Button
//
//  Created by HYEONG SIK NAM on 2022/04/11.
//

import UIKit

enum RotateState {
    case up
    case down
}

class RotateButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
//        fatalError("init(coder:) has not been implemented")
    }
    
    var selectTypeCallback: ((RotateState) -> Void)?
    
    private var isUp = RotateState.down {
        didSet {
            self.changeDesign()
        }
    }
    
    private func configure() {
        self.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
    }
    
    @objc private func selectButton() {
        if isUp == .up {
            isUp = .down
        } else {
            isUp = .up
        }
        selectTypeCallback?(isUp)
    }
    
    private func changeDesign() {
        
        UIView.animate(withDuration: 0.3) {
            if self.isUp == .up {
                self.imageView?.transform = CGAffineTransform(rotationAngle: .pi)
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.25)
            } else {
                self.imageView?.transform = .identity //물론 180도 두번 돌리면 제자리이지만, 정확히 하려면 원래 상태로 돌리는게 좋음
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(1)
            }
        }
        
    }
    
}
