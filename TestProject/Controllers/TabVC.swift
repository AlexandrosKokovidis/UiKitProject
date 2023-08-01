//
//  TabVC.swift
//  TestProject
//
//  Created by Alex Kokovidis on 23/07/2023.
//

import UIKit

class TabVC: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpTabs()
        
        self.tabBar.barTintColor = .black
        self.tabBar.tintColor = .systemBlue
        self.tabBar.backgroundColor = .systemGray
        self.tabBar.unselectedItemTintColor = .black
        
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
