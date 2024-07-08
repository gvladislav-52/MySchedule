//
//  AlertTime.swift
//  MySchedule
//
//  Created by macbookbro on 08.07.2024.
//

import UIKit

extension UIViewController {
    
    func alertTime(label: UILabel, completionHandler: @escaping (NSDate) -> Void) {
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = NSLocale(localeIdentifier: "Ru_ru") as Locale
        
        alert.view.addSubview(datePicker)
        let ok = UIAlertAction(title: "OK", style: .default) { [weak self] (action) in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let timeSting = dateFormatter.string(from: datePicker.date)
            let timeSchedule = datePicker.date as NSDate
            completionHandler(timeSchedule)
            
            label.text = timeSting
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.negativeWidthContraint()
        
        alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true

        present(alert, animated: true, completion: nil)
    }
}
