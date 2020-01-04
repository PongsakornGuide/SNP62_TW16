//
//  tabBarViewController.swift
//  SNP_TW16
//
//  Created by Guide on 10/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class tabBarViewController: UITabBarController ,UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        
        let activityController = tabBarNavigation(unselectedImage: UIImage(named: "activity"), selectedImage: UIImage(named: "activity"), title: "Activity", badgeValue: "1", colorValue: .red,rootViewController: MainActivityViewController())

//        let articleController = tabBarNavigation(unselectedImage: UIImage(named: "article"), selectedImage: UIImage(named: "article"), title: "Article", badgeValue: nil, colorValue: .red,rootViewController: articleViewController())

        let communityController = tabBarNavigation(unselectedImage: UIImage(named: "community"), selectedImage: UIImage(named: "community"), title: "Community", badgeValue: "8", colorValue: .red,rootViewController: CommunViewController())


//        let otherController = tabBarNavigation(unselectedImage: UIImage(named: "other"), selectedImage: UIImage(named: "other"), title: "Other", badgeValue: nil, colorValue: .red,rootViewController: aboutViewController())

        viewControllers = [activityController,communityController]
        
        }
    fileprivate func tabBarNavigation(unselectedImage: UIImage?, selectedImage: UIImage?, title: String?, badgeValue: String?, colorValue: UIColor? ,rootViewController: UIViewController = UIViewController())-> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -4, right: 0)
        navController.title = title
        navController.tabBarItem.badgeColor = colorValue
        navController.tabBarItem.badgeValue = badgeValue
        return navController
    }

//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//
//        let index = viewControllers?.lastIndex(of: viewController)
//
//        if index == 1 {
//            let photoController = articleViewController()
//            self.navigationController?.pushViewController(photoController, animated: true)
////            let photoController = UINavigationController(rootViewController: MainActivityViewController())
////            present(photoController, animated: true, completion: nil)
//        }
//
//        return true
    }

        
//}