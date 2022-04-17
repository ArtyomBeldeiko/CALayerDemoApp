//
//  CustomUIView.swift
//  CALayerDemoApp
//
//  Created by Artyom Beldeiko on 28.02.22.
//

import UIKit

@IBDesignable
class CustomUIView: UIView {
    
    private var size = CGSize()
    @IBInspectable var cornerRadiiSize: CGFloat = 0 {
        didSet {
            size = CGSize(width: cornerRadiiSize, height: cornerRadiiSize)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: size).cgPath
        
        layer.mask = shapeLayer
        
    }
    
    override func prepareForInterfaceBuilder() {
        setNeedsLayout()
    }
    
}
