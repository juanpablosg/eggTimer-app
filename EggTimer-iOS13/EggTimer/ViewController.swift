//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    let softTime = 5
//    let mediumTime = 8
//    let hardTime = 15
    var player: AVAudioPlayer!
    
    var counter = 0
    
    var firstCounter: Float = 0.0
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 9]
    
    var timer = Timer()
    
    @IBOutlet weak var title1: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 0.0
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        title1.text = hardness

//        switch hardness {
//        case "Soft":
//            counter = eggTimes["Soft"]!
//        case "Medium":
//            counter = eggTimes["Medium"]!
//        case "Hard":
//            counter = eggTimes["Hard"]!
//        default:
//            counter = 0
//        }
         counter = eggTimes[hardness]!
        firstCounter = Float(eggTimes[hardness]!)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds to the end of the world")
            counter -= 1
            
            progressBar.progress = 1 - (Float(counter) / firstCounter)
            
//            if counter == 0 {
//                title1.text = "Done"
//            }
        } else {
            timer.invalidate()
            
            playSound()
            
            title1.text = "DONE!"
        }
    }
    

}
