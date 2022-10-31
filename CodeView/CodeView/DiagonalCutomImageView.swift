//
//  DiagonalCutomImageView.swift
//  CodeView
//
//  Created by HYEONG SIK NAM on 2022/04/26.
//

import UIKit

@IBDesignable
class DiagonalCutomImageView: UIImageView {

    @IBInspectable var innerHeight: CGFloat = 0
    
    
    func makePath() -> UIBezierPath{
        let path = UIBezierPath()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        path.close()
        
        return path
    }

    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = makePath().cgPath
        
        return shapeLayer
    }
    
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
    
    override func layoutSubviews() {
        makeMask()
    }
    
}
