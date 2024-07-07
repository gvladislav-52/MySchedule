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
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let idTaskCell = "idTaskCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Tasks"
        setupCalenderView()
        setupTableView()
        
    }
}

//MARK: - SetupLayout
extension TasksViewController {
    private func setupCalenderView() {
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
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false   //отключение прокрутки если мало элементов
        tableView.register(TasksTableViewCell.self, forCellReuseIdentifier: idTaskCell)
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: customCalendarView.showHideButton.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

//MARK: - PressReadyTaskButtonProtocol
extension TasksViewController: PressReadyTaskButtonProtocol {
    func readyButtonTapped(indexPath: IndexPath) {
        print("Tap \(indexPath)")
    }
}

//MARK: - UITableViewDelegate, UITableViewSource
extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: idTaskCell, for: indexPath) as! TasksTableViewCell
        cell.cellTaskDelegate = self
        cell.index = indexPath
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
