//
//  CustomUIButton.swift
//  CALayerDemoApp
//
//  Created by Artyom Beldeiko on 28.02.22.
//

import UIKit

@IBDesignable
class CustomUIButton: UIButton {
    
    var cornerRadii = CGSize()
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            cornerRadii = CGSize(width: cornerRadius, height: cornerRadius)
        }
    }
    
    @IBInspectable var color: UIColor = .systemBlue
    
    var path: UIBezierPath?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: cornerRadii)
        color.setFill()
        path?.fill()
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if let path = path {
            return path.contains(point)
        }
        return false
    }
}
