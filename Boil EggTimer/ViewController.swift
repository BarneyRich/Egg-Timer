//
//  ViewController.swift
//  Boil EggTimer
//
//  Created by Barnabas Bala on 28.01.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimesHardness = ["Soft": 6, "Medium": 9, "Hard": 12]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player : AVAudioPlayer!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
    }
    
    
    
    @IBAction func EggHardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimesHardness[hardness]!
        
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLable.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if(secondsPassed < totalTime) {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
          print("\(secondsPassed) seconds")
            
            
        } else {
            timer.invalidate()
            titleLable.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    
    
}
