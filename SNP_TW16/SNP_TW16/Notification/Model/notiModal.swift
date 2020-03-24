//
//  notiModal.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 12/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import ObjectMapper

class countlistNotification: Mappable{
    
    var id: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["countNoti"]
    }
    
}

class listNotification: Mappable{
    
    var id: Int?
    var user_id: Int?
    var title: String?
    var testtitle: String?
    var friend: String?
    var create: String?
    var username: String?
    var photo: String?
    
    //deatil
    var dataId:Int?
    var actId:String?
    var type:String?
    var caption:String?
    var imagePost:String?
    var content:String?
    var imgact:String?
    var imgtime:String?
    var created:String?
    var join:Int?
    var invite:Int?
    var startTime:String?
    var endtime:String?
    
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        user_id <- map["user_id"]
        title <- map["contentAct"]
        testtitle <- map["title"]
        friend <- map["friend"]
        create <- map["Timer"]
        username <- map["username"]
        photo <- map["photo"]
        
        //deatil
        dataId   <- map["id"]
        actId  <- map["title"]
        type <- map["type"]
        caption <- map["leaderActivity"]
        imagePost <- map["img"]
        content <- map["content"]
        imgact <- map["imgact"]
        imgtime <- map["imgtime"]
        created <- map["startDate"]
        join <- map["maxJoin"]
        invite <- map["invaite"]
        startTime <- map["startTime"]
        endtime <- map["endTime"]
    }
}

class listNotificationPost: Mappable{
    
    var id: Int?
    var userId: Int?
    var otherId: Int?
    var adposTtimeline: Int?
//    var contentPost: String?
    var photo: String?
    var username: String?
    var caption: String?
    var create: String?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        userId <- map["user_id"]
        otherId <- map["other_id"]
        adposTtimeline <- map["ad_post_timeline_id"]
//        contentPost <- map["contentPost"]
        photo <- map["photo"]
        username <- map["username"]
        caption <- map["caption"]
        create <- map["create_at"]
    }
}

//class allList: Mappable{
//    var id: Int?
//    var userAppId: Int?
//    var caption: String?
//    var img: String?
//    var createdAt: String?
//    var username: String?
//    var photo: String?
//    var likeActivity: Int?
//    var commentsActivity: Int?
//    required init?(map: Map) {
//
//    }
//    // Mappable
//    func mapping(map: Map) {
//        id  <- map["id"]
//        userAppId  <- map["user_app_id"]
//        caption <- map["caption"]
//        img  <- map["img"]
//        createdAt <- map["created_at"]
//        username  <- map["username"]
//        photo <- map["photo"]
//        likeActivity <- map["likeActivity"]
//        commentsActivity <- map["commentsActivity"]
//
//    }
//}
