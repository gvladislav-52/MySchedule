//
//  OptionScheduleTableViewCell.swift
//  MySchedule
//
//  Created by macbookbro on 07.07.2024.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {
    
    let backgroundViewCell: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameCellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reapetSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.isHidden = false
        repeatSwitch.onTintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
    }()
    
    let addImageContact: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.fill.badge.plus")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBackgroundViewCell()
        setupNameCellLabel()
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupLayout
extension OptionsTableViewCell {
    
    private func setupBackgroundViewCell() {
        self.addSubview(backgroundViewCell)
        NSLayoutConstraint.activate([
            backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
        ])
    }
    
    private func setupNameCellLabel() {
        self.addSubview(nameCellLabel)
        NSLayoutConstraint.activate([
            nameCellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameCellLabel.leadingAnchor.constraint(equalTo: backgroundViewCell.leadingAnchor, constant: 15),
        ])
    }
    
    private func setupRepeatSwitch(indexPath: IndexPath) {
        if indexPath == [4, 0] {
            if !self.contentView.subviews.contains(reapetSwitch) {
                self.contentView.addSubview(reapetSwitch)
                NSLayoutConstraint.activate([
                    reapetSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                    reapetSwitch.trailingAnchor.constraint(equalTo: backgroundViewCell.trailingAnchor, constant: -20),
                ])
                reapetSwitch.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
            }
        } else {
            reapetSwitch.removeFromSuperview()
        }
    }
    
    private func setupAddImageContact() {
        self.contentView.addSubview(addImageContact)
        NSLayoutConstraint.activate([
            addImageContact.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            addImageContact.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            addImageContact.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            addImageContact.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    func cellScheduleConfigure(nameArray: [[String]],indexPath: IndexPath) {
        nameCellLabel.text = nameArray[indexPath.section][indexPath.row]
        backgroundViewCell.backgroundColor = .white
        if indexPath == [3,0] {
            backgroundViewCell.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }
        setupRepeatSwitch(indexPath: indexPath)
    }

    
    func cellTaskConfigure(nameArray: [String], indexPath: IndexPath) {
        nameCellLabel.text = nameArray[indexPath.section]
        
        if indexPath == [3,0] {
            backgroundViewCell.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }
    }
    
    func cellContactConfigure(nameArray: [String], indexPath: IndexPath) {
        nameCellLabel.text = nameArray[indexPath.section]
        
        if indexPath.section == 4 {
            setupAddImageContact()
        }
    }
    
    @objc func switchChange(paramTarget: UISwitch) {
        print("switch")
    }
}
