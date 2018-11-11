//
//  PairingProcessViewController.swift
//  Colors
//
//  Created by JuunKi Jin on 09/09/2018.
//  Copyright © 2018 C4nvas. All rights reserved.
//

import UIKit

class WiFiPairingViewController: UIViewController {
    override func viewDidLoad() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate;
    }
    
    @IBAction func popView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
