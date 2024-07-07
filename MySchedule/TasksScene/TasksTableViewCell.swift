//
//  TasksTableViewCell.swift
//  MySchedule
//
//  Created by macbookbro on 07.07.2024.
//

import UIKit

class TasksTableViewCell: UITableViewCell {
    
    weak var cellTaskDelegate: PressReadyTaskButtonProtocol?
    var index: IndexPath?
        
    let taskName = UILabel (text: "Программирование", font: .avenirNextDemiBold20())
    let taskDescription = UILabel(text: "Научиться писать extension и правильное их применять", font: .avenirNext14())
    
    let readyButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "chevron.down.circle"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setReadyButton()
        setTaskName()
        setTaskDesctiption()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupLayout
extension TasksTableViewCell {
    private func setReadyButton() {
        self.contentView.addSubview(readyButton)        //добавляем кнопку в ячейку
        NSLayoutConstraint.activate([
            readyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            readyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            readyButton.heightAnchor.constraint(equalToConstant: 40),
            readyButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        readyButton.addTarget(self, action: #selector(readyButtonTapped), for: .touchUpInside)
    }
    
    @objc func readyButtonTapped() {
        guard let index = index else {return}
        cellTaskDelegate?.readyButtonTapped(indexPath: index)
    }
    
    private func setTaskName() {
        self.addSubview(taskName)
        NSLayoutConstraint.activate([
            taskName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            taskName.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant: -5),
            taskName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            taskName.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func setTaskDesctiption() {
        self.addSubview(taskDescription)
        taskDescription.numberOfLines = 2
        NSLayoutConstraint.activate([
            taskDescription.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 5),
            taskDescription.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant: -5),
            taskDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            taskDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
}
