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
    var player: AVAudioPlayer!
    let eggTimer = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var totalTime : Int = 0
    var passedTime: Int = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        let time = eggTimer[hardness]!
        progressBar.progress = 0
        
        titleLabel.text = "Cooking \(hardness) egg, awaits..."
        print("Egg \(hardness) will be ready in \(time) time")
        totalTime = time
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.contdownTimer), userInfo: nil, repeats: true)
    }
    
    @objc func contdownTimer() {
        if passedTime <= totalTime {
            print("\(totalTime - passedTime) time remaining")
            let percent = Float(passedTime) / Float(totalTime)
            progressBar.progress = percent
            passedTime += 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            self.playSound()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.titleLabel.text = "How do you like your eggs?"
                self.progressBar.progress = 0
            }
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
