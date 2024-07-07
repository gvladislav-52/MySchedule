//
//  ScheduleViewController.swift
//  MySchedule
//
//  Created by macbookbro on 07.07.2024.
//

import UIKit
import FSCalendar

class ScheduleViewController: UIViewController {
    
    private var calendar: FSCalendar = {
            let calendar = FSCalendar()
            calendar.translatesAutoresizingMaskIntoConstraints = false
            return calendar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Schedule"
        
        setConstraints()
    }
}

//MARK: - SetContrraints
extension ScheduleViewController {
    func setConstraints() {
        view.addSubview(calendar)
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            calendar.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
