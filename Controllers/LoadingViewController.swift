//
//  LoadingViewController.swift
//  CALayerDemoApp
//
//  Created by Artyom Beldeiko on 28.02.22.
//

import UIKit

class LoadingViewController: UIViewController {
    
    var replicatorLayer: CAReplicatorLayer!
    var sourceLayer: CALayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        replicatorLayer = CAReplicatorLayer()
        sourceLayer = CALayer()
        
        self.view.layer.addSublayer(replicatorLayer)
        replicatorLayer.addSublayer(sourceLayer)
        
        startAnimation(delay: 0.1, replicates: 30) {
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 5) {
                self.transitionForward()
            }
        }
        
    }
    
    override func viewWillLayoutSubviews() {
        
        replicatorLayer.frame = self.view.bounds
        replicatorLayer.position = self.view.center
        
        sourceLayer.frame = CGRect(x: 0.0, y: 0.0, width: 3, height: 17)
        sourceLayer.backgroundColor = UIColor.white.cgColor
        sourceLayer.position = self.view.center
        sourceLayer.anchorPoint = CGPoint(x: 0.0, y: 5.0)
        
    }
    
    func startAnimation(delay: TimeInterval, replicates: Int, completion: () -> ()) {
        
        replicatorLayer.instanceCount = replicates
        let angle = CGFloat(2.0 * .pi) / CGFloat(replicates)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)
        
        replicatorLayer.instanceDelay = delay
        
        sourceLayer.opacity = 0
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0
        opacityAnimation.duration = Double(replicates) * delay
        opacityAnimation.repeatCount = 2
        opacityAnimation.isRemovedOnCompletion = true
        
        sourceLayer.add(opacityAnimation, forKey: nil)
        
        completion()
        
    }
    
    @objc func transitionForward() {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}
