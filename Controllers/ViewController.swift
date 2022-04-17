//
//  ViewController.swift
//  CALayerDemoApp
//
//  Created by Artyom Beldeiko on 24.02.22.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    var mintGradient: CAGradientLayer! {
        didSet {
            mintGradient.startPoint = CGPoint(x: 0, y: 0)
            mintGradient.endPoint = CGPoint(x: 1, y: 1)
            mintGradient.colors = [UIColor.white.cgColor, UIColor.lightGray.cgColor, UIColor.systemMint.cgColor]
            //            mintGradient.locations = [1, 0.1, 0.4]
            
        }
    }
    
    var lightGrayGradient: CAGradientLayer! {
        didSet {
            lightGrayGradient.startPoint = CGPoint(x: 0, y: 0.75)
            lightGrayGradient.endPoint = CGPoint(x: 1, y: 1)
            lightGrayGradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
            
        }
    }
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 25
            shapeLayer.lineCap = .round
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            shapeLayer.strokeColor = UIColor.white.cgColor
        }
    }
    
    var overShareLayer: CAShapeLayer! {
        didSet {
            overShareLayer.lineWidth = 25
            overShareLayer.lineCap = .round
            overShareLayer.fillColor = nil
            overShareLayer.strokeEnd = 0
            overShareLayer.strokeColor = UIColor.darkGray.cgColor
        }
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.width / 2
            imageView.layer.masksToBounds = true
            imageView.layer.borderColor = CGColor(red: 128, green: 128, blue: 128, alpha: 0.7)
            imageView.layer.borderWidth = 6
        }
    }
    
    @IBOutlet weak var paydayButton: UIButton! {
        didSet {
            paydayButton.layer.cornerRadius = 12
            paydayButton.layer.shadowOffset = CGSize(width: 1, height: 3)
            paydayButton.layer.shadowOpacity = 0.6
            paydayButton.layer.shadowRadius = 3
        }
    }
    
    override func viewDidLayoutSubviews() {
        mintGradient.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        lightGrayGradient.frame = CGRect(x: 0, y: 1, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        
        shapeLayerConfig(shapeLayer)
        shapeLayerConfig(overShareLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mintGradient = CAGradientLayer()
        view.layer.insertSublayer(mintGradient, at: 0)
        lightGrayGradient = CAGradientLayer()
        view.layer.insertSublayer(lightGrayGradient, below: mintGradient)
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        overShareLayer = CAShapeLayer()
        view.layer.addSublayer(overShareLayer)
        
    }
    
    @IBAction func paydayButtonClicked(_ sender: Any) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = true
        
        animation.delegate = self
        
        overShareLayer.add(animation, forKey: nil)
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let loadingVC = storyboard?.instantiateViewController(withIdentifier: "LoadingViewController") as! LoadingViewController
        navigationController?.pushViewController(loadingVC, animated: true)
    }
    
    func shapeLayerConfig(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.imageView.frame.height + 150))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.imageView.frame.height + 150))
        shapeLayer.path = path.cgPath
    }
    
}

