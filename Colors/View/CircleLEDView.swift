//
//  CircleLEDView.swift
//  Colors
//
//  Created by JuunKi Jin on 08/09/2018.
//  Copyright © 2018 C4nvas. All rights reserved.
//

import UIKit

class CircleLEDView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.addEllipse(in: rect)
        context.setFillColor(UIColor(red:0.37, green:0.82, blue:0.72, alpha:1.0).cgColor)
        context.fillPath()
    }
}

