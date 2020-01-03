//
//  Items.swift
//  Item List
//
//  Created by Wittaya Malaratn on 6/16/18.
//  Copyright © 2018 Wittaya Malaratn. All rights reserved.
//

import UIKit

struct Items {
    
    let itemCategory: String
    let itemImage: [String]

    
    init(itemCategory: String, itemImage: [String]) {
        self.itemCategory = itemCategory
        self.itemImage = itemImage
    }
    
    static func items() -> [Items] {
        
        var items = [Items]()
        items.append(Items(itemCategory: "ธรรมชาติ \n สิ่งแวดล้อม", itemImage: ["forest"]))
        items.append(Items(itemCategory: "ศาสนา \n ปฏิบัติธรรม", itemImage: ["Component-1"]))
        items.append(Items(itemCategory: "การศึกษา \n เรียนรู้ ฝึกอบรบ", itemImage: ["open-book"]))
        items.append(Items(itemCategory: "เกษตร \n สัตว์เลี้ยง", itemImage: ["Component"]))
        items.append(Items(itemCategory: "สุขภาพ \n สาธารณสุข", itemImage: ["report"]))
        items.append(Items(itemCategory: "กิจกรรมก \n ลางแจ้ง", itemImage: ["park (3)"]))
        return items
        
    }
}
