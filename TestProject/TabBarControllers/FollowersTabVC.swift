//
//  FollowersTabVC.swift
//  TestProject
//
//  Created by Alex Kokovidis on 23/07/2023.
//

import UIKit

class FollowersTabVC: UITabBarController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, MyCellDelegate, UISearchResultsUpdating {
    
    private var collectionView: UICollectionView?
    private var collectionItems: [ListRowItem] = [
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "1st follower UserName", fullName: "1st follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "2nd follower UserName", fullName: "2nd follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "3rd follower UserName", fullName: "3rd follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "4th follower UserName", fullName: "4th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "5th follower UserName", fullName: "5th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "6th follower UserName", fullName: "6th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "7th follower UserName", fullName: "7th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "8th follower UserName", fullName: "8th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "9th follower UserName", fullName: "9th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "10th follower UserName", fullName: "10th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "11th follower UserName", fullName: "11th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "12th follower UserName", fullName: "12th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "13th follower UserName", fullName: "13th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "14th follower UserName", fullName: "14th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "15th follower UserName", fullName: "15th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "16th follower UserName", fullName: "16th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "17th follower UserName", fullName: "17th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "18th follower UserName", fullName: "18th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "19th follower UserName", fullName: "19th follower Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "20th follower UserName", fullName: "20th follower Name")
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
