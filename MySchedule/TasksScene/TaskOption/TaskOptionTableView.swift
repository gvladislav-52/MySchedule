//
//  TaskOptionTableView.swift
//  MySchedule
//
//  Created by macbookbro on 08.07.2024.
//

import UIKit


class TaskOptionTableView: UITableViewController {
    
    let idOptionsTasksCell = "idOptionsTasksCell"
    let idOptionsTasksHeader = "idOptionsTasksHeader"
    
    let headerNameArray: [String] = ["DATA", "LESSON", "TASK", "COLOR"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Options Tasks"
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskOptionTableViewCell.self, forCellReuseIdentifier: idOptionsTasksCell)
        tableView.register(OptionsHeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsTasksHeader)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTasksCell, for: indexPath) as! TaskOptionTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsTasksHeader) as! OptionsHeaderTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TaskOptionTableViewCell
        
        switch indexPath.section {
        case 0: alertDate(label: cell.nameCellLabel) { (numberWeekday, date) in
            print(numberWeekday, date)
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Name Lesson", placeholder: "Enter name lesson")
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Name Task", placeholder: "Enter name task")
        case 3: pushController(vc: ColorViewController())
        default: break
        }
    }
    
    func pushController(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
