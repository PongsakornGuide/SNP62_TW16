//
//  Relative.swift
//  SNP_TW16
//
//  Created by Guide on 22/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import ObjectMapper
class listRelative: Mappable{
    var relativeTel: Int?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        relativeTel <- map["relative_phone"]
    }
}


class addRelative: Mappable{
    var id: Int?
    var username: String?
    var telphone: Int?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        id  <- map["user_id"]
        username  <- map["name"]
        telphone <- map["tel"]
    }
}
