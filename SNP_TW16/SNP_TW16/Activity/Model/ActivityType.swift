//
//  Timeline.swift
//  SNP_TW16
//
//  Created by Guide on 12/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import ObjectMapper

class ActivityType: Mappable {
    var id: String?
    var activityTypeName: String?
    var activtiyIcon: String?
    var list:[ActivityImpress]?
    let URL_USER_ID = "http://kmsupply.net/alder_iosapp/v1/showDecide.php"
    required init?(map: Map) {

    }
    
    // Mappable
    func mapping(map: Map) {
        id <- map["id"]
        activityTypeName <- map["activity_type_name"]
        activtiyIcon <- map["iconImage"]
        list <- map["activities"]
    }
}


class ActivityImpress: Mappable {
    var activityTypeName: String?
    var activityIcon: String?
    var listDetail:[ActivityDetail]?
    required init?(map: Map) {

    }
    
    // Mappable
    func mapping(map: Map) {
        activityTypeName <- map["activity_name"]
        activityIcon <- map["imgActivity"]
        listDetail <- map["posts"]
    }
}

class ActivityDetail: Mappable {
    var dataId:Int?
    var actId:String?
    var type:String?
    var caption:String?
    var imagePost:String?
    var content:String?
    var imgact:String?
    var imgtime:String?
    var created:String?

    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        dataId   <- map["id"]
        actId  <- map["title"]
        type <- map["type"]
        caption <- map["caption"]
        imagePost <- map["img"]
        content <- map["content"]
        imgact <- map["imgact"]
        imgtime <- map["imgtime"]
        created <- map["created_at"]
    }
}

class emojiUser: Mappable {
    var feelId:Int?
    var feel:String?
    var iconImage:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        feelId <- map["id"]
        feel <- map["feelname"]
        iconImage <- map["ImageIcon"]
    }
}


//class AcivityData: Mappable {
//    var dataId:Int?
//    var actType:String?
//    var imagePost:String?
//    var actId:Int?
//    var actName:String?
//
//    var listDetail:[ActivityDetail]?
//
//    required init?(map: Map) {
//
//    }
//    func mapping(map: Map) {
//        dataId <- map["id"]
//        actType <- map["activity_type_name"]
//        imagePost <- map["iconImage"]
//        actId <- map["activity_id"]
//        actName <- map["activity_name"]
//        listDetail <- map["posts"]
//    }
//}

//class ActivityDetail: Mappable {
//    var dataId:Int?
//    var actId:String?
//    var caption:String?
//    var imagePost:String?
//    var content:String?
//    var imgact:String?
//    var imgtime:String?
//    var created:String?
//
//    required init?(map: Map) {
//
//    }
//
//    // Mappable
//    func mapping(map: Map) {
//        dataId   <- map["id"]
//        actId  <- map["title"]
//        caption <- map["caption"]
//        imagePost <- map["img"]
//        content <- map["content"]
//        imgact <- map["imgact"]
//        imgtime <- map["imgtime"]
//        created <- map["created_at"]
//    }
//}









//class ActivityType: Mappable {
//    var id: String?
//    var activityTypeName: String?
//    var imageIcon: String?
//    var list:[AcivityData]?
//
//    required init?(map: Map) {
//
//    }
//
//    // Mappable
//    func mapping(map: Map) {
//        id <- map["id"]
//        activityTypeName <- map["activity_type_name"]
//        imageIcon <- map["iconImage"]
//        list <- map["posts"]
//    }
//}
//
//class AcivityData: Mappable {
//    var dataId:Int?
//    var actId:String?
//    var caption:String?
//    var imagePost:String?
//    var content:String?
//    var imgact:String?
//    var imgtime:String?
//    var created:String?
//
//    required init?(map: Map) {
//
//    }
//       // Mappable
//    func mapping(map: Map) {
//        dataId   <- map["id"]
//        actId  <- map["title"]
//        caption <- map["caption"]
//        imagePost <- map["img"]
//        content <- map["content"]
//        imgact <- map["imgact"]
//        imgtime <- map["imgtime"]
//        created <- map["created_at"]
//    }
//}

