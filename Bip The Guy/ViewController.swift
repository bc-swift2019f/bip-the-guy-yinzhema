//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Yinzhe Ma on 9/15/19.
//  Copyright © 2019 Yinzhe Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageToPunch: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func animateImage(){
        let bounds=self.imageToPunch.bounds
        let shrinkValue: CGFloat = 60.0
        self.imageToPunch.bounds=CGRect(x: self.imageToPunch.bounds.origin.x+shrinkValue, y: self.imageToPunch.bounds.origin.y+shrinkValue, width: self.imageToPunch.bounds.size.width-shrinkValue, height: self.imageToPunch.bounds.size.height-shrinkValue)
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, options: [], animations: { self.imageToPunch.bounds=bounds }, completion: nil)
    }
    
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
    }
    
}

