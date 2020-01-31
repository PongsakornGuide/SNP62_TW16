//
//  Emergency.swift
//  SNP_TW16
//
//  Created by Guide on 1/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import ObjectMapper
class allListTel: Mappable{
    var emergencyId: Int?
    var emergencyName: String?
    var emergencyCall: Int?
    var emergencyIcon: String?
    required init?(map: Map) {

    }
    // Mappable
    func mapping(map: Map) {
        emergencyId  <- map["id"]
        emergencyName  <- map["name"]
        emergencyCall <- map["tel"]
        emergencyIcon <- map["iconImage"]
    }
}


