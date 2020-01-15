//
//  Activity.swift
//  SNP_TW16
//
//  Created by Guide on 19/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit
import ObjectMapper
class CommentList: Mappable {
    var id: Int?
    var userId : Int?
    var userName : String?
    var postId : Int?
    var post : String?
    var created : String?
    var like : Int?
    var imageView : String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        userId <- map["user_id"]
        userName <- map["username"]
        postId <- map["ad_post_timeline_id"]
        post <- map["post"]
        created <- map["created_at"]
        like <- map["likepost"]
        imageView <- map["photo"]
    }
}

