//
//  HomeVC.swift
//  TestProject
//
//  Created by Alex Kokovidis on 24/07/2023.
//

import UIKit

class HomeController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRectMake(0, 0, view.frame.width - 32, view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UIUserResultCollectionViewRow.self, forCellWithReuseIdentifier: "Cell")
        
        setUpMenuBar()
    }
    
    let menuBar: MenuBar = {
       let mb = MenuBar()
        
        return mb
    }()
    
    private func setUpMenuBar() {
        view.addSubview(menuBar)
//        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
//        view.addConstraintsWithFormat("", views: menuBar)
    }
}
