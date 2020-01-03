//
//  PageControl.swift
//  SNP_TW16
//
//  Created by Guide on 19/12/2562 BE.
//  Copyright © 2562 guide. All rights reserved.
//

import UIKit

struct PageControl {
    
    let imageIcon: UIImage?
    let titleText: String
    let subTitle: String
    
    init(imageIcon: UIImage?, titleText: String, subTitle: String) {
        self.imageIcon = imageIcon
        self.titleText = titleText
        self.subTitle = subTitle
    }
    
    static func pages() -> [PageControl] {
        
        var pages = [PageControl]()
        
        pages.append(PageControl(imageIcon: UIImage(named: "shopping-bag"), titleText: "Welcome to our AShop", subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."))
        pages.append(PageControl(imageIcon: UIImage(named: "fast-delivery"), titleText: "Fast Delivery", subTitle: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae a."))
        pages.append(PageControl(imageIcon: UIImage(named: "free-delivery"), titleText: "Free Delivery", subTitle: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam."))
        pages.append(PageControl(imageIcon: UIImage(named: "buy"), titleText: "Free Return & Refund", subTitle: "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur."))
        
        return pages
        
    }
    
}

