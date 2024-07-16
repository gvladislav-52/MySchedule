import UIKit

class OptionTableViewController: UITableViewController {
    
    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"
    
    let headerNameArray: [String] = ["DATA AND TIME", "LESSON", "TEACHER", "COLOR", "PERIOD"]
    
    var cellNameArray = [["Date", "Time"],
                         ["Name", "Type", "Building", "Audience"],
                         ["Teacher Name"],
                         [""],
                         ["Repeat every 7 days"]]
    
    var firebase: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Option Schedule"
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
        tableView.register(OptionsHeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)

    }
    
    func fetchFirestoreData() {
        APIManager.shared.getPost(collection: "schedule", docName: "options") { [weak self] data in
            guard let self = self else { return }
            guard let data = data else {
                print("No data found")
                return
            }
            
            self.cellNameArray = data
            print(self.cellNameArray)
            // Reload table view data to reflect changes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return cellNameArray[0].count
        case 1: return cellNameArray[1].count
        case 2: return cellNameArray[2].count
        case 3: return cellNameArray[3].count
        default: return cellNameArray[4].count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! OptionsTableViewCell
        
        // Configure the cell using cellNameArray
        cell.cellScheduleConfigure(nameArray: cellNameArray, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsSheduleHeader) as! OptionsHeaderTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath {
        case [0,0]: alertDate(label: cell.nameCellLabel) { [weak self]  (numberWeekday, date) in
            print(numberWeekday, date)
        }
        case [0,1]: alertTime(label: cell.nameCellLabel) { [weak self] (date) in
            print(date)
        }
        case [1,0]: alertForCellName(label: cell.nameCellLabel, name: "Name lesson", placeholder: "Enter name lesson")
        case [1,1]: alertForCellName(label: cell.nameCellLabel, name: "Type lesson", placeholder: "Enter type lesson")
        case [1,2]: alertForCellName(label: cell.nameCellLabel, name: "Building number", placeholder: "Enter number of building")
        case [1,3]: alertForCellName(label: cell.nameCellLabel, name: "Audience number", placeholder: "Enter number of audience")
        case [2,0]:
            pushController(vc: TeachersViewController())
        case [3,0]:
            pushController(vc: ColorViewController())
        default:
            print("Tap OptionsTableView")
        }
    }
    
    func pushController(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
}
