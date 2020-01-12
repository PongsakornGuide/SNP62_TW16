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
    var imageIcon: String?
    var list:[AcivityData]?

    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        id    <- map["id"]
        activityTypeName  <- map["activity_type_name"]
        imageIcon <- map["iconImage"]
        list  <- map["data"]
    }
}


class AcivityData: Mappable {
    var dataId:Int?
    var actId:String?
    var caption:String?
//    var title:String?
//    var activityUserApps:String?
//    var activityName:String?
    var imagePost:String?
    
    required init?(map: Map) {

    }

       // Mappable
    func mapping(map: Map) {
        dataId   <- map["id"]
        actId  <- map["title"]
        caption <- map["aption "]
        imagePost <- map["img"]
        
//        title  <- map["act_id"]
//        activityUserApps  <- map["activity_user_apps"]
//        activityName  <- map["activity_name"]
    }
}

