//
//  File1.swift
//  TestProject
//
//  Created by Alex Kokovidis on 23/07/2023.
//

import UIKit

class FollowingsTabVC: UITabBarController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, MyCellDelegate, UISearchResultsUpdating {
    
    private var collectionView: UICollectionView?
    private var collectionItems: [ListRowItem] = [
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "1st following UserName", fullName: "1st following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "2nd following UserName", fullName: "2nd following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "3rd following UserName", fullName: "3rd following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "4th following UserName", fullName: "4th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "5th following UserName", fullName: "5th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "6th following UserName", fullName: "6th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "7th following UserName", fullName: "7th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "8th following UserName", fullName: "8th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "9th following UserName", fullName: "9th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "10th folowing UserName", fullName: "10th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "11th folowing UserName", fullName: "11th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "12th folowing UserName", fullName: "12th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "13th folowing UserName", fullName: "13th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "14th folowing UserName", fullName: "14th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "15th folowing UserName", fullName: "15th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "16th folowing UserName", fullName: "16th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "17th folowing UserName", fullName: "17th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "18th folowing UserName", fullName: "18th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "19th folowing UserName", fullName: "19th following Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "20th folowing UserName", fullName: "20th following Name")
    ]
    private var searchBar: UISearchController = {
        let sb = UISearchController()
        sb.searchBar.placeholder = "Type for search..."
        sb.searchBar.searchBarStyle = .minimal
        
        return sb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width / 1.1,
                                 height: view.frame.size.height / 20)
        
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(UIUserResultCollectionViewRow.self,
                                forCellWithReuseIdentifier: UIUserResultCollectionViewRow.identifier)
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
        collectionView.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UIUserResultCollectionViewRow.identifier,
                                                      for: indexPath) as! UIUserResultCollectionViewRow
        
        cell.configure(image: collectionItems[indexPath.row].image,
                       name: collectionItems[indexPath.row].name,
                       fullName: collectionItems[indexPath.row].fullName)
        cell.delegate = self
        
        return cell
    }
    
    func buttonTapped(in cell: UIUserResultCollectionViewRow) {
        let indexPath = collectionView?.indexPath(for: cell)
        
        guard (indexPath != nil) else {
            print("Result row tapped at index: \(indexPath?.item ?? 0)")
            
            return
        }
        
        let alertController = UIAlertController(title: "Action button info",
                                                message: "You've tapped action button at \(indexPath?.item ?? 0) row.",
                                                preferredStyle: UIAlertController.Style.alert)
        
        let DestructiveAction = UIAlertAction(title: "Cancel",
                                              style: UIAlertAction.Style.destructive) {
            (result : UIAlertAction) -> Void in
            print("Cancel button tapped")
        }
        
        let okAction = UIAlertAction(title: "OK",
                                     style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
            cell.button.style = cell.button.style == .secondary ? .primary : .secondary
            cell.button.title = cell.button.title == "Follow" ? "UnFollow" : "Follow"
            cell.button.title = cell.button.title == "AddFriend" ? "Pending" : "AddFriend"
        }
        
        alertController.addAction(DestructiveAction)
        alertController.addAction(okAction)
        
        cell.button.showAnimation {
            alertController.show()
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        //TODO:
    }
}
