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
    var relativeName: String?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        relativeTel <- map["relative_phone"]
        relativeName <- map["relative_name"]
    }
}


class addRelative: Mappable{
    var id: Int?
    var idTel: Int?
    var username: String?
    var telphone: Int?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        id  <- map["user_id"]
        idTel <- map["id"]
        username  <- map["name"]
        telphone <- map["tel"]
    }
}
