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
//    let URL_USER_ID = "http://172.20.10.5/alder_iosapp/v1/showDecide.php"
    let URL_USER_ID = "\(AppDelegate.link)alder_iosapp/v1/showDecide.php"
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
    var join:Int?
    var invite:Int?
    var startTime:String?
    var endtime:String?
    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
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

class prayerUser: Mappable {
    var id:Int?
    var title:String?
    var content:String?
    var image:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        content <- map["content"]
        image <- map["image"]
    }
}

class StoryUser: Mappable {
    var id:Int?
    var title:String?
    var caption:String?
    var content:String?
    var image:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        caption <- map["caption"]
        content <- map["content"]
        image <- map["image"]
    }
}

class VideoUser: Mappable {
    var id:Int?
    var url:String?
    var content:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        url <- map["url"]
        content <- map["content"]
    }
}


