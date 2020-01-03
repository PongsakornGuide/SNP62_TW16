//
//  Activity.swift
//  SNP_TW16
//
//  Created by Guide on 19/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
struct Activity {
    var id_Ad : Int = 0
    let imageProfile : String?
    let username : String?
    let time : String?
    let titlePost : String?
    let imagePost : String?
    let like : String?
    let comment : String?
    
    init(id_Ad: Int,imageProfile: String?,username: String?, time: String?, titlePost: String?,imagePost : String?,like: String?,comment : String?) {
       
        self.id_Ad = id_Ad
        self.imageProfile = imageProfile
        self.username = username
        self.time = time
        self.titlePost = titlePost
        self.imagePost = imagePost
        self.like = like
        self.comment = comment
}
    
//    static func activity() -> [Activity] {
//        var activity = [Activity]()
//        
//        activity.append(Activity(imageProfile: UIImage(named: "michael"), username: "Pongskaorn", time: "12.12", titlePost: "HELLO WORLd", imagePost: UIImage(named: "val-vesa-P0F_zH39qhs-unsplash"),like: "150", comment: "12"))
//        
//         activity.append(Activity(imageProfile: UIImage(named: "michael"), username: "Pongskaorn", time: "12.12", titlePost: "HELLO WORLd", imagePost: UIImage(named: "val-vesa-P0F_zH39qhs-unsplash"),like: "150", comment: "12"))
//        
//         activity.append(Activity(imageProfile: UIImage(named: "michael"), username: "Pongskaorn", time: "12.12", titlePost: "HELLO WORLd", imagePost: UIImage(named: "val-vesa-P0F_zH39qhs-unsplash"),like: "150", comment: "12"))
//        
//         activity.append(Activity(imageProfile: UIImage(named: "michael"), username: "Pongskaorn", time: "12.12", titlePost: "HELLO WORLd", imagePost: UIImage(named: "val-vesa-P0F_zH39qhs-unsplash"),like: "150", comment: "12"))
//        
//         activity.append(Activity(imageProfile: UIImage(named: "michael"), username: "Pongskaorn", time: "12.12", titlePost: "HELLO WORLd", imagePost: UIImage(named: "val-vesa-P0F_zH39qhs-unsplash"),like: "150", comment: "12"))
//        return activity
//    }
}
