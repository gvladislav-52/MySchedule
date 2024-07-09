//
//  ScheduleViewController.swift
//  MySchedule
//
//  Created by macbookbro on 07.07.2024.
//

import UIKit
import FSCalendar

class ScheduleViewController: UIViewController {
    
    private var customCalendarView: CustomCalendarView!
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let idScheduleCell = "idScheduleCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Schedule"
        setupCalenderView()
        setupTableView()
        setupNavigationItem()
        
        if #available(iOS 15.0, *) {
            navigationController?.tabBarController?.tabBar.scrollEdgeAppearance = navigationController?.tabBarController?.tabBar.standardAppearance
        }
    }
}

//MARK: - SetupLayout
extension ScheduleViewController {
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
        tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: idScheduleCell)
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: customCalendarView.showHideButton.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddButtonTapped))
    }
    
    @objc func AddButtonTapped() {
        let scheduleOption = OptionTableViewController()
        navigationController?.pushViewController(scheduleOption, animated: true)
    }
}

//MARK: - UITableViewDelegate, UITableViewSource
extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: idScheduleCell, for: indexPath) as! ScheduleTableViewCell
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

//MARK: - FSCalendarDataSource, FSCalendarDelegate
extension ScheduleViewController: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        customCalendarView.calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
}
