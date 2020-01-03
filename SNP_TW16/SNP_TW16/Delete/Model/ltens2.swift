//
//  ltens2.swift
//  SNP_TW16
//
//  Created by Guide on 12/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//


import UIKit

struct Items2 {
    
    let itemCategory: String
    let itemImage: [String]
  

    
    init(itemCategory: String,itemImage: [String]) {
        self.itemCategory = itemCategory
        self.itemImage = itemImage
    }
    
    static func items() -> [Items2] {
        
        var items = [Items2]()
        
        items.append(Items2(itemCategory: "สุขภาพ สาธารณสุข", itemImage: ["report"]))
        items.append(Items2(itemCategory: "งานและจิตอาสา", itemImage: ["portfolio"]))
        items.append(Items2(itemCategory: "กิจกรรมกลางแจ้ง", itemImage: ["park (3)"]))
        return items
        
    }
}
