//
//  SegueToRight.swift
//  Colors
//
//  Created by JuunKi Jin on 10/09/2018.
//  Copyright © 2018 C4nvas. All rights reserved.
//

import UIKit

class SegueToRight: UIStoryboardSegue {
    override func perform() {
        let src = self.source
        let dst = self.destination
        
        src.view.superview?.insertSubview(dst.view, belowSubview: src.view)
        src.view.transform = CGAffineTransform(translationX: 0, y: 0)
        dst.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width/3, y: 0)
        
        UIView.animate(withDuration: 0.25,
            delay: 0.0,
            options: .curveEaseInOut,
            animations: {
                src.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
                dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
            },
            completion: { finished in
                src.dismiss(animated: false, completion: nil)
            }
        )
    }
}
