////
////  settingsLauncher.swift
////  SNP_TW16
////
////  Created by Pongsakorn Piya-ampornkul on 12/3/2563 BE.
////  Copyright © 2563 guide. All rights reserved.
////
//
//import UIKit
//class settingsLauncher: NSObject {
//    
//    let blackView = UIView()
//       @objc func morePost(){
//           
//           if let window = UIApplication.shared.keyWindow {
//            
//               blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
//               blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handDismiss)))
//                      window.addSubview(blackView)
//                      blackView.frame = frame
//               blackView.alpha = 0
//               
//               UIView.animate(withDuration: 0.5, animations: {
//                   self.blackView.alpha = 1
//               })
//           }
//
//       
//       }
//       
//       @objc func handDismiss() {
//           UIView.animate(withDuration: 0.5) {
//               self.blackView.alpha = 0
//           }
//       }
//       
//    
//    override init() {
//        super.init()
//    }
//}
