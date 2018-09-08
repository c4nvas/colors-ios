//
//  TriangleView.swift
//  Colors
//
//  Created by JuunKi Jin on 08/09/2018.
//  Copyright © 2018 C4nvas. All rights reserved.
//

import UIKit
import CoreGraphics


class TriangleView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let gradientMask = CAShapeLayer()
        let gradientLayer = CAGradientLayer()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - 40))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.close()
        
        gradientMask.frame = rect
        gradientMask.path = path.cgPath
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [
            UIColor(red:0.37, green:0.82, blue:0.72, alpha:1.0).cgColor,
            UIColor(red:0.05, green:0.87, blue:0.50, alpha:1.0).cgColor ]
        gradientLayer.frame = rect
        gradientLayer.mask = gradientMask
        
        self.layer.addSublayer(gradientLayer)
    }
}
