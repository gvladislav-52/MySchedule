//
//  ScheduleTableViewCell.swift
//  MySchedule
//
//  Created by macbookbro on 07.07.2024.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    let lessonName = UILabel (text: "Программирование", font: .avenirNextDemiBold20())
    let teacherName = UILabel (text: "Антонов Антон Анатольевич", font: .avenirNext20(), aligment: .right)
    let lessonTime = UILabel (text: "08:00", font: .avenirNextDemiBold20())
    let typeLabel = UILabel (text: "Тип:", font: .avenirNext14(), aligment: .right)
    let lessonType = UILabel (text: "Лекция", font: .avenirNextDemiBold14())
    let buildingLabel = UILabel (text: "Корпус:", font: .avenirNext14(), aligment: .right)
    let lessonBuilding = UILabel (text: "1", font: .avenirNextDemiBold14())
    let audLabel = UILabel (text: "Аудитория", font: .avenirNext14(), aligment: .right)
    let lessonAud = UILabel (text: "101", font: .avenirNextDemiBold14())
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [self] in    //задержка от размера построение экрана
//            setContraints()
//        }
        setContraints()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContraints() {
        
        let topStackView = UIStackView(arrangedSubviews: [lessonName,teacherName], axis: .horizontal, spacing: 10, distribution: .fillEqually)
        
        self.addSubview(topStackView)
        NSLayoutConstraint.activate ([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(lessonTime)
        NSLayoutConstraint.activate([
            lessonTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lessonTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            lessonTime.widthAnchor.constraint(equalToConstant: 100),
            lessonTime.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        let bottomStackView = UIStackView(arrangedSubviews: [typeLabel, lessonType, buildingLabel, lessonBuilding, audLabel, lessonAud], axis: .horizontal, spacing: 5, distribution: .fillProportionally)
        
        self.addSubview(bottomStackView)
        NSLayoutConstraint.activate ([
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: lessonTime.trailingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
