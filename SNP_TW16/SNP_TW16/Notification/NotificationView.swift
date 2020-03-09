//
//  NotificationView.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 9/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import UserNotifications

extension NotificationView : UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound,.badge])
    }
}

class NotificationView: UIViewController {
    
    lazy var submitButton : UIButton = {
            let submit = UIButton(type: UIButton.ButtonType.system)
            submit.backgroundColor = UIColor.white
            submit.layer.borderColor = UIColor.rgb(red: 33, green: 64, blue: 154).cgColor
            submit.layer.borderWidth = 2
            submit.backgroundColor =  UIColor.rgb(red: 33, green: 64, blue: 154)
            submit.layer.cornerRadius = 30
            submit.setTitle("ขอรหัสยืนยัน", for: .normal)
            submit.setTitleColor(UIColor.white,for: .normal)
            submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            submit.addTarget(self, action: #selector(submitBtn), for: .touchUpInside)
            return submit
    }()
    
    
    func NotificaitonUser(){
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.subtitle = "Subtitle"
        content.body = "body"
        content.sound = UNNotificationSound.default
        
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: triger)
        
        UNUserNotificationCenter.current().add(request) { (Error) in
            print(Error as Any)
            
        }
    }
    
    @objc func submitBtn(){
        print("5555")
        NotificaitonUser()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        view.addSubview(submitButton)
    
        submitButton.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: 20, bottomConstant: 20, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 80)
    }
    
}
