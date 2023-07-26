//
//  CustomButtonView.swift
//  TestProject
//
//  Created by Alex Kokovidis on 17/07/2023.
//

import UIKit

class CustomButton: UIButton {
    
    enum Style {
        case primary
        case secondary
    }
    
    enum Size {
        case small
        case medium
        case large
    }
    
    enum Corner {
        case small
        case medium
        case large
    }
    
    public var size: Size = .large {
        didSet {
            updateButtonSize()
        }
    }
    
    public var style: Style = .primary {
        didSet {
            updateButtonStyle()
        }
    }
    
    public var corner: Corner = .large {
        didSet {
            updateButtonCornerRadii()
        }
    }
    
    public var title: String = "" {
        didSet {
            setTitle(title, for: .normal)
        }
    }
    
    convenience init(style: Style,
                     size: Size,
                     corner: Corner,
                     title: String) {
        
        self.init(frame: .zero)
        
        postInit()
        
        self.style = style
        self.size = size
        self.corner = corner
        self.title = title
    }
    
    private func postInit() {
        updateButtonSize()
        updateButtonStyle()
    }
    
    private var smallContentEdgeInsets: UIEdgeInsets{
        UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    private var mediumContentEdgeInsets: UIEdgeInsets{
        UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    private var largeContentEdgeInsets: UIEdgeInsets{
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    private func updateButtonSize() {
        switch size {
        case .small:
            contentEdgeInsets = smallContentEdgeInsets
        case .medium:
            contentEdgeInsets = mediumContentEdgeInsets
        case .large:
            contentEdgeInsets = largeContentEdgeInsets
        }
    }
    
    public func updateButtonStyle() {
        switch style {
        case .primary:
            backgroundColor = .systemBlue
        case .secondary:
            backgroundColor = .systemGray
            tintColor = .white
        }
        
        updateButtonCornerRadii()
    }
    
    // MARK: Layout
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        updateButtonCornerRadii()
    }
    
    private func updateButtonCornerRadii() {
        switch corner {
        case .large:
            layer.cornerRadius = 4
        case .medium:
            layer.cornerRadius = 8
        case .small:
            layer.cornerRadius = 16
        }
    }
}
