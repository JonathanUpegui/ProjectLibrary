//
//  CustomTextField.swift
//  ProjectLibrary
//
//  Created by Upegui on 9/02/22.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
   override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
   }
}
