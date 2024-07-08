//
//  UIAlertController.swift
//  MySchedule
//
//  Created by macbookbro on 08.07.2024.
//

import UIKit

extension UIAlertController {
    
    func negativeWidthContraint() {
        
        for subView in self.view.subviews {
            for constraints in subView.constraints where constraints.debugDescription.contains("width == -16") {
                subView.removeConstraint(constraints)
            }
        }
    }
}
