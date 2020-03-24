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
    var createdAt: String?
    var username: String?
    var photo: String?
    var likeActivity: Int?
    var commentsActivity: Int?
    required init?(map: Map) {

    }
    // Mappable
    func mapping(map: Map) {
        id  <- map["id"]
        userAppId  <- map["user_app_id"]
        caption <- map["caption"]
        img  <- map["img"]
        createdAt <- map["Timer"]
        username  <- map["username"]
        photo <- map["photo"]
        likeActivity <- map["likeActivity"]
        commentsActivity <- map["commentsActivity"]
        
    }
}

