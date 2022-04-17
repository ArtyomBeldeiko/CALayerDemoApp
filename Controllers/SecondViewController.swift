//
//  SecondViewController.swift
//  CALayerDemoApp
//
//  Created by Artyom Beldeiko on 24.02.22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var grayGradient: CAGradientLayer! {
        didSet {
            grayGradient.startPoint = CGPoint(x: 1, y: 0)
            grayGradient.endPoint = CGPoint(x: 1, y: 1)
            grayGradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        }
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.width / 2
            imageView.layer.masksToBounds = true
            imageView.layer.borderColor = CGColor(red: 0 / 255, green: 107 / 255, blue: 118 / 255, alpha: 0.75)
            imageView.layer.borderWidth = 6
        }
    }
    
    @IBOutlet weak var takeSalaryButton: UIButton! {
        didSet {
            takeSalaryButton.layer.cornerRadius = 15
            takeSalaryButton.layer.shadowOffset = CGSize(width: 2, height: 10)
            takeSalaryButton.layer.shadowOpacity = 0.5
            takeSalaryButton.layer.shadowRadius = 5
        }
    }
    
    override func viewDidLayoutSubviews() {
        grayGradient.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        grayGradient = CAGradientLayer()
        view.layer.insertSublayer(grayGradient, at: 0)
        
    }
    
    @IBAction func takeSalaryButtonClicked(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
}
