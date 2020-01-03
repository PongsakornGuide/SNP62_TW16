//
//  items3.swift
//  SNP_TW16
//
//  Created by Guide on 12/10/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit

struct Items3 {
    
    let itemCategory: String
    let itemImage: [String]
    let itemImage1: [String]
    let itemName: String
    let itemTime: String
    
    init(itemCategory: String, itemImage: [String],itemImage1: [String],itemName: String,itemTime:String) {
        self.itemCategory = itemCategory
        self.itemImage = itemImage
        self.itemImage1 = itemImage1
        self.itemName = itemName
        self.itemTime = itemTime
    }
    
    static func items() -> [Items3] {
        
        var items = [Items3]()
        
        items.append(Items3(itemCategory: "LOVE & RELATIONSHIP \nรักตนเอง…เพื่อรักคนข้างๆ \n อย่างเข้าใจ", itemImage: ["asian-elderly-couple-feeling-happy-smiling-looking-camera-while-relax-living-room-home_7861-1562"],itemImage1: ["Group 574"],itemName: "โดย wecare",itemTime: "18ตุลาคม 2562"))
        

        return items
        
    }
}
