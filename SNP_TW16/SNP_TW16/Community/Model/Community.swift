//
//  Community.swift
//  SNP_TW16
//
//  Created by Guide on 14/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//
import UIKit
import ObjectMapper
class allList: Mappable{
    var id: Int?
    var userAppId: Int?
    var caption: String?
    var img: String?
    var like: Int?
    var comment: Int?
    var createdAt: String?
    var username: String?
    var photo: String?
//    var listAct:[allAct]?
    required init?(map: Map) {

    }
    // Mappable
    func mapping(map: Map) {
        id  <- map["id"]
        userAppId  <- map["user_app_id"]
        caption <- map["caption"]
        img  <- map["img"]
        like    <- map["like"]
        comment  <- map["comment"]
        createdAt <- map["created_at"]
        username  <- map["username"]
        photo <- map["photo"]
//        listAct <- map["hh"]
    }

}


//class allAct: Mappable {
//    var id: String?
//    var userAppId: String?
//    var caption: String?
//    var img: String?
//    var like: Int?
//    var comment: Int?
//    var createdAt: String?
//    var username: String?
//    var photo: String?
//    
//    required init?(map: Map) {
//
//    }
//       // Mappable
//    func mapping(map: Map) {
//               id  <- map["id"]
//               userAppId  <- map["user_app_id"]
//               caption <- map["caption"]
//               img  <- map["img"]
//               like    <- map["like"]
//               comment  <- map["comment"]
//               createdAt <- map["created_at"]
//               username  <- map["username"]
//               photo <- map["photo"]
//    }
//}
