//
//  ContactOptionTableViewController.swift
//  MySchedule
//
//  Created by macbookbro on 08.07.2024.
//

import UIKit


class ContactOptionTableViewController: UITableViewController {
    
    let idOptionsContactCell = "idOptionsContactCell"
    let idOptionsContactHeader = "idOptionsContactHeader"
    
    let headerNameArray: [String] = ["NAME", "PHONE", "MAIL", "TYPE", "IMAGE"]
    
    let cellNameArray = ["Name", "Phone", "Mail", "Type", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Option Schedule"
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsContactCell)
        tableView.register(OptionsHeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsContactHeader)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsContactCell, for: indexPath) as! OptionsTableViewCell
        cell.cellContactConfigure(nameArray: cellNameArray, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 4 ? 200: 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsContactHeader) as! OptionsHeaderTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell

        switch indexPath.section {
        case 0: alertForCellName(label: cell.nameCellLabel, name: "Name Contact", placeholder: "Enter name contact")
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Phone Contact", placeholder: "Enter phone contact")
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Mail Contact", placeholder: "Enter mail contact")
        case 3: alertType(label: cell.nameCellLabel) { [weak self]  (type) in
            print(type)
        }
        case 4: alertPhotoCamera { [weak self] source in
                if let self = self {
                    self.chooseImagePicker(source: source)
                }
        }
        default:
            print("Tap ContactTableView")
        }
    }
    
    func pushController(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ContactOptionTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source)
        {
            let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = true
                imagePicker.sourceType = source
                present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let cell = tableView.cellForRow(at: [4,0]) as! OptionsTableViewCell

        cell.addImageContact.image = info[.editedImage] as? UIImage
        cell.addImageContact.contentMode = .scaleAspectFill
        cell.addImageContact.clipsToBounds = true
        dismiss(animated: true)
    }
}
