//
//  UIUserResultCollectionViewRow.swift
//  TestProject
//
//  Created by Alex Kokovidis on 09/07/2023.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, MyCellDelegate {
    
    private var collectionItems: [ListRowItem] = [
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "1st UserName", fullName: "1st Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "2nd UserName", fullName: "2nd Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "3rd UserName", fullName: "3rd Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "4th UserName", fullName: "4th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "5th UserName", fullName: "5th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "6th UserName", fullName: "6th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "7th UserName", fullName: "7th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "8th UserName", fullName: "8th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "9th UserName", fullName: "9th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "10th UserName", fullName: "10th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "11th UserName", fullName: "11th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "12th UserName", fullName: "12th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "13th UserName", fullName: "13th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "14th UserName", fullName: "14th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "15th UserName", fullName: "15th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "16th UserName", fullName: "16th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "17th UserName", fullName: "17th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "18th UserName", fullName: "18th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "19th UserName", fullName: "19th Name"),
        ListRowItem(image: UIImage(named: "default.avatar")!, name: "20th UserName", fullName: "20th Name")
    ]
    
    private var collectionView: UICollectionView?
    
    private var searchBar: UISearchController = {
        let sb = UISearchController()
        sb.searchBar.placeholder = "Type for search..."
        sb.searchBar.searchBarStyle = .minimal
        
        return sb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width / 1.1,
                                 height: view.frame.size.height / 20)

        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)

        guard let collectionView = collectionView else {
            return
        }

        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar
        collectionView.register(UIUserResultCollectionViewRow.self,
                                forCellWithReuseIdentifier: UIUserResultCollectionViewRow.identifier)
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        view.backgroundColor = .systemGray
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
    
}
