//
//  Choice.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 1/4/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit

struct Choice {
    let title : String?
    let profileImage : UIImage?
    
    init(title:String,profileImage:UIImage?) {
        self.title = title
        self.profileImage = profileImage
    }
    
    static func choiceofUser() -> [Choice] {
        var choice = [Choice]()
        choice.append(Choice(title: "ผู้ดูแลมีการดูแลที่ไม่ทั่วถึง", profileImage: UIImage(named: "rectangle142")))
        choice.append(Choice(title: "กิจกรรมที่จัดขึ้นมีความน่าสนใจน้อยกว่าที่ควร", profileImage: UIImage(named: "rectangle142")))
        choice.append(Choice(title: "สภาพแวดล้อมในกิจกรรมไม่เอื้ออำนวย", profileImage: UIImage(named: "rectangle142")))
        choice.append(Choice(title: "อื่นๆ โปรดระบุ", profileImage: UIImage(named: "rectangle142")))
        return choice
    }
}


