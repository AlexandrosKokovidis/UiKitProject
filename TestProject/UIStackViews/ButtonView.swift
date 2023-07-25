//
//  ButtonView.swift
//  TestProject
//
//  Created by Alex Kokovidis on 18/07/2023.
//

import UIKit

class ButtonView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stackView.addArrangedSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.backgroundColor = .green
        
        return stack
    }()
    
    private let button: CustomButton = {
        CustomButton(
            style: .secondary,
            size: .small,
            corner: .medium,
            title: "Action Button"
        )
    }()
}
