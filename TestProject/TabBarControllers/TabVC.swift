//
//  TabVC.swift
//  TestProject
//
//  Created by Alex Kokovidis on 23/07/2023.
//

import UIKit

class TabVC: UITabBarController, UITabBarControllerDelegate {
    
    private var collectionView: UICollectionView?
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpTabs()
        
        self.tabBar.barTintColor = .black
        self.tabBar.tintColor = .systemBlue
        self.tabBar.unselectedItemTintColor = .systemGray
        
        self.delegate = self
        
      
    }
    
    private func setUpTabs() {
        let followers = self.createNav(with: "Followers", vc: FollowersTabVC())
        let followings = self.createNav(with: "Followings", vc: FollowingsTabVC())
        
        self.setViewControllers([followers, followings], animated: true)
    }
    
    private func createNav(with title: String, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        
        nav.viewControllers.first?.navigationItem.title = title
        
        return nav
    }
}
