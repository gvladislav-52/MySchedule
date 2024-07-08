//
//  AlertForCellName.swift
//  MySchedule
//
//  Created by macbookbro on 08.07.2024.
//

import UIKit

extension UIViewController {
    func alertForCellName(label: UILabel, name: String, placeholder: String) {
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            let tfAlert = alert.textFields?.first
            guard let text = tfAlert?.text else {return}
            label.text = text
        }
        
        alert.addTextField{(tfAlert) in
            tfAlert.placeholder = placeholder
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
