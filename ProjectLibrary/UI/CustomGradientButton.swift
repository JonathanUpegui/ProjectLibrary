//
//  CustomGradientButton.swift
//  ProjectLibrary
//
//  Created by Upegui on 10/02/22.
//

import Foundation

import UIKit

class CustomGradientButton: UIButton {
    
    let gradient = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = self.bounds
    }
    
    func commonInit() {
        DispatchQueue.main.async {
            self.loadGradient()
        }
    }
    
    private func loadGradient() {
        gradient.frame = self.bounds
        gradient.colors = [
            UIColor(red: 0,
                    green: 0.68,
                    blue: 0.93,
                    alpha: 1).cgColor,
            UIColor(red: 0.22,
                    green: 0.8,
                    blue: 0.8,
                    alpha: 1).cgColor
        ]
        gradient.locations = [0, 0.5, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = 22
        self.layer.insertSublayer(gradient, at: 0)
        self.layer.cornerRadius = 22
    }
}
