//
//  UserNameView.swift
//  TestProject
//
//  Created by Alex Kokovidis on 17/07/2023.
//

import UIKit

class UserNameView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(usernameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.backgroundColor = .red
        
        return stack
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Full name"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "username"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
}
