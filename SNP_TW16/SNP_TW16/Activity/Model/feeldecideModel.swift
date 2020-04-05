//
//  feeldecideModel.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 2/4/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit

struct feeldecideModel {
    let title : String?
    let profileImage : UIImage?
    
    init(title:String,profileImage:UIImage?) {
        self.title = title
        self.profileImage = profileImage
    }
    
    static func feelofUser() -> [Choice] {
        var choice = [Choice]()
        choice.append(Choice(title: "ความสนุก", profileImage: UIImage(named: "friendship1")))
        choice.append(Choice(title: "พบปะสังคม", profileImage: UIImage(named: "maskGroup43")))
        choice.append(Choice(title: "ร่างกายแข็งแรง", profileImage: UIImage(named: "group44")))
        return choice
    }
}
