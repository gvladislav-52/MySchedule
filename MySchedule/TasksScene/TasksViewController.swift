//
//  TasksViewController.swift
//  MySchedule
//
//  Created by macbookbro on 07.07.2024.
//

import UIKit
import FSCalendar

class TasksViewController: UIViewController {

    private var customCalendarView: CustomCalendarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Tasks"
        
        customCalendarView = CustomCalendarView()
        customCalendarView.translatesAutoresizingMaskIntoConstraints = false
        customCalendarView.calendar.delegate = self
        customCalendarView.calendar.dataSource = self
        
        view.addSubview(customCalendarView)
        
        NSLayoutConstraint.activate([
            customCalendarView.topAnchor.constraint(equalTo: view.topAnchor),
            customCalendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customCalendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customCalendarView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - FSCalendarDataSource, FSCalendarDelegate
extension TasksViewController: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        customCalendarView.calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }}
