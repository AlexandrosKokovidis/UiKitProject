//
//  Extensions.swift
//  TestProject
//
//  Created by Alex Kokovidis on 17/07/2023.
//

import UIKit

// MARK: Alert

extension UIAlertController {
    
    func show() {
        present(animated: true, completion: nil)
    }
    
    func present(animated: Bool, completion: (() -> Void)?) {
        if let rootVC = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 }).first?.windows.first?.rootViewController {
            
            presentFromController(controller: rootVC, animated: animated, completion: completion)
        }
    }
    
    private func presentFromController(controller: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if
            let navVC = controller as? UINavigationController,
            let visibleVC = navVC.visibleViewController
        {
            presentFromController(controller: visibleVC, animated: animated, completion: completion)
        } else if
            let tabVC = controller as? UITabBarController,
            let selectedVC = tabVC.selectedViewController
        {
            presentFromController(controller: selectedVC, animated: animated, completion: completion)
        } else if let presented = controller.presentedViewController {
            presentFromController(controller: presented, animated: animated, completion: completion)
        } else {
            controller.present(self, animated: animated, completion: completion);
        }
    }
}

// MARK: Button animation on tap

public extension UIView {
    func showAnimation(_ completionBlock: @escaping () -> Void) {
        isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveLinear,
                       animations: { [weak self] in
            self?.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
        }) {  (done) in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear,
                           animations: { [weak self] in
                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { [weak self] (_) in
                self?.isUserInteractionEnabled = true
                completionBlock()
            }
        }
    }
}

// MARK: Search bar

extension CollectionViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard searchController.searchBar.text != nil else{return}
        
    }
}

// MARK: Tab bar

extension UIViewController {

    func addChildViewController(_ viewController : UIViewController?, forView container: UIView){
        guard let viewController = viewController else { return }
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(viewController)
        container.addSubview(viewController.view)
        let childView = viewController.view

        container.addConstraint(NSLayoutConstraint(item: childView!, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0))
        container.addConstraint(NSLayoutConstraint(item: childView!, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0))
        container.addConstraint(NSLayoutConstraint(item: childView!, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0))
        container.addConstraint(NSLayoutConstraint(item: childView!, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0))
        viewController.didMove(toParent: self)
    }

    func removeChildVC(_ viewController : UIViewController?){

        if let viewController = viewController{
            viewController.willMove(toParent: nil)
            viewController.view.removeFromSuperview()
        }
    }
}

extension FollowingFollowerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return segmentedButtonIndex == 0 ? UserResult.followingsResults.count : UserResult.followersResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserResultCollectionViewCell.identifier,
                                                      for: indexPath) as! UserResultCollectionViewCell
        
        cell.configure(with: segmentedButtonIndex == 0 ? UserResult.followingsResults[indexPath.row] : UserResult.followersResults[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    @objc func swipeGesture(_ gestureRecognizer: UISwipeGestureRecognizer) {
        defer {
            collectionView.reloadData()
            segmentedButtonsView.segmentedButtonIndexChanged(to: segmentedButtonIndex)
        }
        
        guard gestureRecognizer.direction.contains(.right) else {
            segmentedButtonIndex = 1
            return
        }
        
        segmentedButtonIndex = 0
    }
}

extension FollowingFollowerViewController: CellActionDelegate {
    
    func buttonTapped(in cell: UserResultCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell),
              UserResult.followingsResults[indexPath.row].friendshipRelation != .pending else {
            return
        }
        
        print("Button tapped in cell at index: \(indexPath.item)")
        
        let alertController = UIAlertController(title: "Action button info",
                                                message: "You've tapped action button.",
                                                preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: UIAlertAction.Style.destructive) { _ in
                
                print("Cancel button tapped")
            }
        
        let confirmAction = UIAlertAction(
            title: "Confirm",
            style: UIAlertAction.Style.default) { _ in
                
                print("Confirm button tapped")
                
                switch UserResult.followingsResults[indexPath.row].friendshipRelation {
                case .friends:
                    cell.changedFriendshipRelation(to: .notFriends)
                    
                    if let indexPath = self.collectionView.indexPath(for: cell) {
                        UserResult.followingsResults[indexPath.row].friendshipRelation = .notFriends
                    }
                case .notFriends:
                    cell.changedFriendshipRelation(to: .friends)
                    
                    if let indexPath = self.collectionView.indexPath(for: cell) {
                        UserResult.followingsResults[indexPath.row].friendshipRelation = .friends
                    }
                default:
                    break
                }
            }
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

extension FollowingFollowerViewController: SegmentedControlDelegate {
    
    func segmentedButtonIndexChanged(to index: Int) {
        segmentedButtonIndex = index
        collectionView.reloadData()
    }
}
