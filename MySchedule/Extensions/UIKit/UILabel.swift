//
//  UILabel.swift
//  MySchedule
//
//  Created by macbookbro on 07.07.2024.
//

import UIKit
extension UILabel {
    convenience init(text: String, font: UIFont?, aligment: NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = .black
        self.textAlignment = aligment
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
