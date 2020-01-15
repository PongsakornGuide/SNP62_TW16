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
    var imagePost:String?
    var content:String?
    var imgact:String?
    var imgtime:String?
    
    required init?(map: Map) {

    }

       // Mappable
    func mapping(map: Map) {
        dataId   <- map["id"]
        actId  <- map["title"]
        caption <- map["caption"]
        imagePost <- map["img"]
        content <- map["content"]
        imgact <- map["imgact"]
        imgtime <- map["imgtime"]
    }
}

