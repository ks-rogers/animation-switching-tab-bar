//
//  TabSelectedView.swift
//  AnimationSwitchingTabBar
//
//  Created by chocovayashi on 2019/04/13.
//

import UIKit

final class TabSelectedView: UIView {
    
    let imageView: UIImageView
    
    init() {
        self.imageView = UIImageView()
        super.init(frame: .zero)
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(UIColor.red.cgColor)
        
        // Bezier curve
        context.move(to: .zero)
        context.addCurve(to: CGPoint(x: rect.maxX / 2, y: rect.maxY),
                         control1: CGPoint(x: rect.maxX / 4, y: 0),
                         control2: CGPoint(x: rect.maxX / 8, y: rect.maxY))
        context.addCurve(to: CGPoint(x: rect.maxX, y: 0),
                         control1: CGPoint(x: rect.maxX * 7 / 8, y: rect.maxY),
                         control2: CGPoint(x: rect.maxX * 3 / 4, y: 0))
        context.drawPath(using: .fill)
        
        // White Circle
        let whiteCircle = UIView(frame: CGRect(origin: .zero, size: .init(width: 50, height: 50)))
        whiteCircle.layer.position = CGPoint(x: rect.maxX / 2, y: rect.maxY / 2 - 10)
        whiteCircle.backgroundColor = .white
        whiteCircle.layer.cornerRadius = 25
        addSubview(whiteCircle)
        
        imageView.frame = CGRect(origin: .zero, size: .init(width: 35, height: 35))
        imageView.layer.position = CGPoint(x: rect.maxX / 2, y: rect.maxY / 2 - 10)
        addSubview(imageView)
    }
}
