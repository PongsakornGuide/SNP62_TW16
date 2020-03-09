//
//  barChartViewController.swift
//  SNP_TW16
//
//  Created by Pongsakorn Piya-ampornkul on 4/3/2563 BE.
//  Copyright © 2563 guide. All rights reserved.
//

import UIKit
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

    
    lazy var BGViewMap : UIView = {
            let mapView = UIView()
            mapView.backgroundColor = .white
            return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(BGViewMap)
        view.layer.addSublayer(shapeLayer)
        view.layer.addSublayer(shapeLayer2)
        view.layer.addSublayer(shapeLayer3)
        BGViewMap.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, topConstant: 10, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
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
