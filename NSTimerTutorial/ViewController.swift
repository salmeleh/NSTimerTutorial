//
//  ViewController.swift
//  NSTimerTutorial
//
//  Created by Stu Almeleh on 12/7/16.
//  Copyright © 2016 Stu Almeleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var countingLabel: UILabel!
    
    var timer = Timer()
    var counter = 0.0
    var refreshInterval = 0.1
    
    var startTime = TimeInterval()
    var elapsedTime = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //countingLabel.text = toTimeString(time: counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func startButton(_ sender: Any) {
        //timer = Timer.scheduledTimer(timeInterval: refreshInterval, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        if !timer.isValid {
            
            startTime = NSDate.timeIntervalSinceReferenceDate
            
            timer = Timer.scheduledTimer(timeInterval: refreshInterval, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        
    }


    
    
    @IBAction func resetButton(_ sender: Any) {
    
        timer.invalidate()
        countingLabel.text = "00:00:00.00"
        
        //counter = 0
        //countingLabel.text = toTimeString(time: counter)
    }
    
    
    func updateCounter() {
        countingLabel.text = toTimeString(time: counter)
        counter += refreshInterval
    }
    
    func updateTimer() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        elapsedTime = currentTime - startTime
        
        let hours = UInt8(elapsedTime / 3600.0)
        elapsedTime -= (TimeInterval(hours) * 3600)
        
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (TimeInterval(minutes) * 60)
        
        let seconds = UInt8(elapsedTime)
        elapsedTime -= TimeInterval(seconds)
        
        let fraction = UInt8(elapsedTime * 100)
        
        let timeString = String(format:"%02i:%02i:%02i.%02i", hours, minutes, seconds, fraction)
        
        countingLabel.text = timeString
    }
    
    
    func toTimeString(time: Double) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
}

