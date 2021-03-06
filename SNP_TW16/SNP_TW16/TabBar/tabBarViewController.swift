//
//  tabBarViewController.swift
//  SNP_TW16
//
//  Created by Guide on 10/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
class tabBarViewController: UITabBarController ,UITabBarControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
          let activityController = tabBarNavigation(unselectedImage: UIImage(named: "activity"), selectedImage: UIImage(named: "activity"), title: "กิจกรรม", badgeValue: nil, colorValue: .red,rootViewController: MainActivityViewController())

         let communityController = tabBarNavigation(unselectedImage: UIImage(named: "community"), selectedImage: UIImage(named: "community"), title: "สนทนา", badgeValue: nil, colorValue: .red,rootViewController: CommunViewController())

         let emergencyController = tabBarNavigation(unselectedImage: UIImage(named: "hotLine1"), selectedImage: UIImage(named: "Emergency"), title: "โทรด่วน", badgeValue: nil, colorValue: .red,rootViewController: EmergencyViewController())

         let profileController = tabBarNavigation(unselectedImage: UIImage(named: "article"), selectedImage: UIImage(named: "article"), title: "โปรไฟล์", badgeValue: nil, colorValue: .red,rootViewController: ProfileVIewController())

//        grapController
    viewControllers = [activityController,communityController,emergencyController,profileController]
    }
    
    fileprivate func tabBarNavigation(unselectedImage: UIImage?, selectedImage: UIImage?, title: String?, badgeValue: String?, colorValue: UIColor? ,rootViewController: UIViewController = UIViewController())-> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
//        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
        navController.title = title
        return navController
        }
    }
