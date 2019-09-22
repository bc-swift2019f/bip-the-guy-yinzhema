//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Yinzhe Ma on 9/15/19.
//  Copyright © 2019 Yinzhe Ma. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageToPunch: UIImageView!
    var audioPlayer=AVAudioPlayer()
    
    
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
    
    func playSound(soundName:String, audioPlayer: inout AVAudioPlayer)  {
        if let sound=NSDataAsset(name: soundName){
            //use if let to see if the file soundName exists
            do{
                try audioPlayer=AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch{
                //if sound.data is not valid
                print("ERROR: data in \(soundName) couldn't be played as a sound")
            }
        }else{
            //if sound does not work, print out an error
            print("Error: file\(soundName) didn't load")
        }
    }
    
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
    
}

