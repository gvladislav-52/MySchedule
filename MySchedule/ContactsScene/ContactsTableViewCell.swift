//
//  ContactsTableViewCell.swift
//  MySchedule
//
//  Created by macbookbro on 08.07.2024.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    let contactImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "contact")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let phoneImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "phone.fill")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let mailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "envelope.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel = UILabel(text: "Yarosha Olen", font: .avenirNext20())
    let phoneLabel = UILabel(text: "+ 7 123 12 31 23 12", font: .avenirNext14())
    let mainLabel = UILabel(text: "Yarosha_curit_bombook@mail.ru", font: .avenirNext14())
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        contactImageView.layer.cornerRadius = contactImageView.frame.height/2
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        setContactImage()
        setPhoneImage()
        setMailImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupLayout
extension ContactsTableViewCell {
    private func setContactImage() {
        self.addSubview(contactImageView)
        NSLayoutConstraint.activate([
            contactImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            contactImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            contactImageView.widthAnchor.constraint(equalToConstant: 70),
            contactImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func setPhoneImage() {
        self.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
    
    private func setMailImage() {
        let stackView = UIStackView(arrangedSubviews: [phoneImageView, phoneLabel, mailImageView, mainLabel], axis: .horizontal, spacing: 3, distribution: .fillProportionally)
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
}
