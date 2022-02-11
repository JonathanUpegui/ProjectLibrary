//
//  ButtonCustom.swift
//  ProjectLibrary
//
//  Created by Upegui on 26/01/22.
//

import Foundation
import UIKit

class ButtonCustom: UIButton {
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = .systemBlue
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 18
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
}
