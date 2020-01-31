//
//  Profile.swift
//  SNP_TW16
//
//  Created by Guide on 31/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import ObjectMapper

class ListPostUser: Mappable {
    var idUser:Int?
    var idPost: String?
    var titlePost: String?
    var typePost: String?
    var captionPost: String?
    var contentPost: String?
    var imgPost: String?
    var imgactPost: String?
    var imgtimePost: String?
    var actIdPost: String?
    var createdPost: String?
    var updatePost: String?
    
    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        idUser <- map["id"]
        idPost <- map["user_id"]
        titlePost <- map["title"]
        typePost <- map["type"]
        captionPost <- map["caption"]
        contentPost <- map["content"]
        imgPost <- map["img"]
        imgactPost <- map["imgact"]
        imgtimePost <- map["imgtime"]
        actIdPost <- map["act_id"]
        createdPost <- map["created_at"]
        updatePost <- map["update_at"]
    }
}
