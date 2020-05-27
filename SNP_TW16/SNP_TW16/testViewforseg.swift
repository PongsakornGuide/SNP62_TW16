//
//  testViewforseg.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 14/4/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import TwicketSegmentedControl
class testViewforseg: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titles = ["กิจกรรมที่กำลังมาถึง", "กิจกรรมผ่านไปแล้ว"]
        let frame = CGRect(x: 5, y: view.frame.height / 2 - 20, width: view.frame.width - 10, height: 40)

        let segmentedControl = TwicketSegmentedControl(frame: frame)
        segmentedControl.setSegmentItems(titles)
        segmentedControl.delegate = self as? TwicketSegmentedControlDelegate

        view.addSubview(segmentedControl)
    }
}
