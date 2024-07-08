//
//  ContactsViewController.swift
//  MySchedule
//
//  Created by macbookbro on 07.07.2024.
//

import UIKit


class ContactsTableViewController: UITableViewController {
    
    let idContactsCell = "idContactsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.separatorStyle = .singleLine
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: idContactsCell)
        
        setupNavigationItem()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idContactsCell, for: indexPath) as! ContactsTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print("TAPCEL")
    }
}

extension ContactsTableViewController {
    private func setupNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddButtonTapped))
    }
    
    @objc func AddButtonTapped() {
        let contactsOption = ContactOptionTableViewController()
        navigationController?.pushViewController(contactsOption, animated: true)
    }
}
