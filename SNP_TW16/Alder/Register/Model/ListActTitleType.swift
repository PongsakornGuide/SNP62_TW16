//
//  ListActTitleType.swift
//  SNP_TW16
//
//  Created by Guide on 30/1/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import ObjectMapper
class ListDetailActivity: Mappable {
    
    var activityId: Int?
    var activityName: String?
    var imgAcivity: String?
    var activtiyIcon: String?

    required init?(map: Map) {

    }
    
    // Mappable
    func mapping(map: Map) {
        activityId <- map["id"]
        activityName <- map["activity_name"]
        imgAcivity <- map["imgActivity"]
        activtiyIcon <- map["iconImage"]
    }
    
}
