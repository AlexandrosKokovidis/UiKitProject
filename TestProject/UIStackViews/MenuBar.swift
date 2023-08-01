//
//  MenuBar.swift
//  TestProject
//
//  Created by Alex Kokovidis on 24/07/2023.
//

import UIKit

class MenuBar: UIView {
    let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
//        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
//        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        collectionView.backgroundColor = UIColor.red
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
