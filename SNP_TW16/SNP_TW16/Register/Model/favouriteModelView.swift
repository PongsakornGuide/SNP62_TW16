//
//  favouriteModelView.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 3/4/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit

struct favouriteModelView {
    let title : String?
    let profileImage : UIImage?
    
    init(title:String,profileImage:UIImage?) {
        self.title = title
        self.profileImage = profileImage
    }
    
    static func favouriteofUser() -> [favouriteModelView] {
        var favourite = [favouriteModelView]()
        favourite.append(favouriteModelView(title: "กีฬา", profileImage: UIImage(named: "maskGroup28")))
        favourite.append(favouriteModelView(title: "ทำอาหาร", profileImage: UIImage(named: "maskGroup27")))
        favourite.append(favouriteModelView(title: "ศาสนา", profileImage: UIImage(named: "maskGroup29")))
        favourite.append(favouriteModelView(title: "งานประดิษฐ์", profileImage: UIImage(named: "maskGroup36")))
        favourite.append(favouriteModelView(title: "ออกกำลังกาย", profileImage: UIImage(named: "maskGroup37")))
        favourite.append(favouriteModelView(title: "ความรู้", profileImage: UIImage(named: "maskGroup31")))
        favourite.append(favouriteModelView(title: "ผ่อนคลาย", profileImage: UIImage(named: "maskGroup32")))
        favourite.append(favouriteModelView(title: "ทำสวน", profileImage: UIImage(named: "maskGroup30")))
        return favourite
    }
}
