//
//  TextField.swift
//  ProjectLibrary
//
//  Created by Upegui on 26/01/22.
//

import Foundation
import UIKit

extension UITextField {
    
//    This function is used to give an UNDERLINE to the textField
    
    func underlined() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 30 - 1, width: 300, height: 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
     }
    // Call with....
    // yourTextField.underlined()
 }
