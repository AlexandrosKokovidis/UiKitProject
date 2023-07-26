//
//  CustomCell.swift
//  TestProject
//
//  Created by Alex Kokovidis on 09/07/2023.
//

import UIKit

protocol MyCellDelegate: AnyObject {
    func buttonTapped(in cell: UIUserResultCollectionViewRow)
}

class UIUserResultCollectionViewRow: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    weak var delegate: MyCellDelegate?
    
    private let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "house")
        iv.clipsToBounds = true
        iv.tintColor = .label
        
        return iv
    }()
    
    private let labelView: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16,
                                 weight: .medium)
        label.text = "Error"
        
        return label
    }()
    
    public var button: CustomButton = .init(
        style: .secondary,
        size: .small,
        corner: .medium,
        title: "Action Button"
    )
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Full Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "User Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let verticalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = NSLayoutConstraint.Axis.vertical
        sv.alignment = UIStackView.Alignment.leading
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    let horizontalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = NSLayoutConstraint.Axis.horizontal
        sv.alignment = UIStackView.Alignment.center
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    let userFullName: UserNameView = {
        let userName = UserNameView()
        
        userName.nameLabel.textColor = .secondaryLabel
        userName.nameLabel.text = "Alex"
        userName.nameLabel.font = UIFont.systemFont(ofSize: 14)
        
        userName.usernameLabel.textColor = .secondaryLabel
        userName.usernameLabel.text = "Alex Alexis"
        userName.usernameLabel.font = UIFont.systemFont(ofSize: 14)
        
        userName.usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return userName
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(horizontalStackView)
        
        verticalStackView.addArrangedSubview(usernameLabel)
        verticalStackView.addArrangedSubview(nameLabel)
        
        horizontalStackView.addArrangedSubview(profileImage)
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(button)
        
        button.style = .primary
        button.title = "Follow"
        button.corner = .large
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        setUpConstrains()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func configure(image: UIImage,
                          name: String,
                          fullName: String) {
        profileImage.image = image
        nameLabel.text = name
        usernameLabel.text = fullName
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        labelView.text = nil
        profileImage.image = nil
    }
    
    @objc func buttonTapped() {
        delegate?.buttonTapped(in: self)
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            profileImage.heightAnchor.constraint(equalToConstant: 48),
            profileImage.widthAnchor.constraint(equalToConstant: 48),
            profileImage.rightAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: -32),
            
            horizontalStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            horizontalStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            
            button.heightAnchor.constraint(equalToConstant: 24),
            button.widthAnchor.constraint(equalToConstant: 106)
            
        ])
    }
}
