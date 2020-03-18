//
//  barChartViewController.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 4/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
import EventKitUI
class barChartViewController: UIViewController {
//        let shapeLayer = CAShapeLayer()
    
    
    lazy var shapeLayer : CAShapeLayer = {
        let Shape = CAShapeLayer()
        let center = view.center
            let circularPath = UIBezierPath(arcCenter: center, radius: 70, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
            Shape.frame = CGRect(x: 0, y: -150, width: 0, height: 0)
            Shape.strokeEnd = 0
            Shape.path = circularPath.cgPath
            Shape.lineCap = CAShapeLayerLineCap.round
            Shape.strokeColor = UIColor.red.cgColor
            Shape.lineWidth = 10
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
            return Shape
    }()
    
    lazy var shapeLayer2 : CAShapeLayer = {
            let Shape = CAShapeLayer()
            let center = view.center
                let circularPath = UIBezierPath(arcCenter: center, radius: 70, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
                Shape.frame = CGRect(x: 0, y: 30, width: 0, height: 0)
                Shape.strokeEnd = 0
                Shape.path = circularPath.cgPath
                Shape.lineCap = CAShapeLayerLineCap.round
                Shape.strokeColor = UIColor.blue.cgColor
                Shape.lineWidth = 10
                view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
                return Shape
    }()
    
    lazy var shapeLayer3 : CAShapeLayer = {
            let Shape = CAShapeLayer()
            let center = view.center
                let circularPath = UIBezierPath(arcCenter: center, radius: 70, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
                Shape.frame = CGRect(x: 0, y: 210, width: 0, height: 0)
                Shape.strokeEnd = 0
                Shape.path = circularPath.cgPath
                Shape.lineCap = CAShapeLayerLineCap.round
                Shape.strokeColor = UIColor.green.cgColor
                Shape.lineWidth = 10
                view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
                return Shape
    }()

    
     let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.rgb(red: 33, green: 64, blue: 154)
        button.layer.cornerRadius = 20
        button.setTitle("ขั้นตอนต่อไป", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.BaiJamjureeBold(size: 20)
        button.addTarget(self, action: #selector(pushto), for: .touchUpInside)
        return button
    }()
    @objc func pushto(){
        let eventStore : EKEventStore = EKEventStore()
        // 'EKEntityTypeReminder' or 'EKEntityTypeEvent'
        eventStore.requestAccess(to: .event) { (granted, error) in
            
        if (granted) && (error == nil) {
            print("granted \(granted)")
            print("error \(error)")
            let event:EKEvent = EKEvent(eventStore: eventStore)
            
            //start
            let isoDateStart = "2020-03-17T22:00:00+0700"
            let dateFormatterStart = DateFormatter()
            dateFormatterStart.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatterStart.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            dateFormatterStart.timeZone = NSTimeZone(abbreviation: "ICT") as TimeZone?
            let dateStart = dateFormatterStart.date(from:isoDateStart)
            print(dateStart!)
            event.startDate = dateStart!

            //end
            let isoDateEnd = "2020-03-18T09:00:00+0700"
            let dateFormatterEnd = DateFormatter()
            dateFormatterEnd.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatterEnd.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            dateFormatterEnd.timeZone = NSTimeZone(abbreviation: "ICT") as TimeZone?
            let dateEnd = dateFormatterEnd.date(from:isoDateEnd)
            print(dateEnd!)
            event.endDate = dateEnd!
            
            //header alert
            event.title = "กิจกรรมสร้างสุข"
            //title alert
            event.notes = "กิจกรรมจะเตือนคุณในอีกไม่ช้านี้"
            event.calendar = eventStore.defaultCalendarForNewEvents
            
            //alert before start activity 1 hour
            let alarm1hour = EKAlarm(relativeOffset: -3600)
            
            //alert before start activity 1 day
            let alarm1day = EKAlarm(relativeOffset: -86400)
            
            event.addAlarm(alarm1day)
            event.addAlarm(alarm1hour)
            
            do {
                try eventStore.save(event, span: .thisEvent)
            } catch let error as NSError {
                print("failed to save event with error : \(error)")
            }
                print("Saved Event")
            } else{
                print("failed to save event with error : \(error) or access not granted")
            }
        }
    }
 
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let check = Date()
//        print(check)
        
    
        
//        view.addSubview(BGViewMap)
        view.addSubview(nextButton)
//        view.layer.addSublayer(shapeLayer)
//        view.layer.addSublayer(shapeLayer2)
//        view.layer.addSublayer(shapeLayer3)
//        BGViewMap.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 10, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
//
        nextButton.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: nil, topConstant: 10, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        view.backgroundColor = .white
        
    }
    
    @objc func handleTap() {
        print("Attemting to animate stroke")

        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
             basicAnimation.toValue = 0.7
             basicAnimation.duration = 2
             basicAnimation.fillMode = CAMediaTimingFillMode.forwards
             basicAnimation.isRemovedOnCompletion = false
             shapeLayer.add(basicAnimation, forKey: "urSoBasic")
          
          let basicAnimation1 = CABasicAnimation(keyPath: "strokeEnd")
             basicAnimation1.toValue = 0.3
             basicAnimation1.duration = 2
             basicAnimation1.fillMode = CAMediaTimingFillMode.forwards
             basicAnimation1.isRemovedOnCompletion = false
          shapeLayer2.add(basicAnimation1, forKey: "urSoBasic")
          
          let basicAnimation2 = CABasicAnimation(keyPath: "strokeEnd")
             basicAnimation2.toValue = 1
             basicAnimation2.duration = 2
             basicAnimation2.fillMode = CAMediaTimingFillMode.forwards
             basicAnimation2.isRemovedOnCompletion = false
             shapeLayer3.add(basicAnimation2, forKey: "urSoBasic")

    }

}
