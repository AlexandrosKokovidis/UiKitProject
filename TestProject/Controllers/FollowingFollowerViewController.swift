//
//  FollowingFollowerViewController.swift
//  TestProject
//
//  Created by Alex Kokovidis on 26/07/2023.
//

import UIKit

class FollowingFollowerViewController: UIViewController {
    
    lazy var usernameTitle: UILabel = {
        let usernameTitle = UILabel()
        usernameTitle.textAlignment = .center
        usernameTitle.text = "Username"
        
        return usernameTitle
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.barStyle = .default
        searchBar.barTintColor = UIColor.white
        searchBar.backgroundImage = UIImage()
        
        return searchBar
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width / 1.1,
                                 height: view.frame.size.height / 20)
        
        return UICollectionView(frame: .zero,
                                collectionViewLayout: layout)
    }()
    
    lazy var segmentedButtonsView: SegmentedButtonsView = {
        
        let segmentedButtonsView = SegmentedButtonsView()
        
        segmentedButtonsView.setLabelsTitles(titles: ["Following", "Followers"])
        segmentedButtonsView.translatesAutoresizingMaskIntoConstraints = false
        segmentedButtonsView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        segmentedButtonsView.layer.borderColor = UIColor(ciColor: .white).cgColor
        segmentedButtonsView.layer.borderWidth = 0.5
        
        return segmentedButtonsView
        
    }()
    
    public var segmentedButtonIndex = 0
    
    var swipeGestureRecognizer: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupConstraints()
    }
    
    private func configUI() {
        view.backgroundColor = .white
        
        usernameTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTitle)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        
        segmentedButtonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedButtonsView)
        segmentedButtonsView.segmentedControlDelegate = self
        
        collectionView.register(UserResultCollectionViewCell.self,
                                forCellWithReuseIdentifier: UserResultCollectionViewCell.identifier)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeLeft.direction = .left
        collectionView.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeRight.direction = .right
        collectionView.addGestureRecognizer(swipeRight)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            usernameTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            usernameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            usernameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameTitle.widthAnchor.constraint(equalToConstant: view.frame.width),
            usernameTitle.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: usernameTitle.bottomAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.widthAnchor.constraint(equalToConstant: view.frame.width),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            segmentedButtonsView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            segmentedButtonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentedButtonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            segmentedButtonsView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: segmentedButtonsView.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 16),
            collectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height)
        ])
    }
}
