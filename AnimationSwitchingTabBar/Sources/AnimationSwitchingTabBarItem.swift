//
//  AnimationSwitchingTab.swift
//  AnimationSwitchingTabBar
//
//  Created by chocovayashi on 2019/04/09.
//

import UIKit

open class AnimationSwitchingTabBarItem: UIView {
    open var isGraduallyUpAlpha = true
    open func setNotSelectedItem() {}
    open func setSelectedItem() {}
    open func animate() {}
}

/// an default item in the animatable tab bar controller.
open class AnimationSwitchingTabBarDefaultItem: AnimationSwitchingTabBarItem {

    /// The animationSwitchingTabBarDefaultItem's an icon image.
    var iconImage: UIImage? {
        didSet {
            iconImageView.image = iconImage
        }
    }
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0.5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconImageView)
    }

    /// Define constraints and styles if the item is not selected.
    override open func setNotSelectedItem() {
        let itemSize = CGSize(width: 30, height: 30)
        iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: itemSize.width).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: itemSize.height).isActive = true
    }
    
    /// Define constraints and styles if the item is selected.
    open override func setSelectedItem() {
        let itemSize = CGSize(width: 32, height: 32)
        iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: itemSize.width).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: itemSize.height).isActive = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
