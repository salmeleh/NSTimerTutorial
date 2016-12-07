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
    @IBOutlet weak var timer2Label: UILabel!
    
    var timer = Timer()
    var timer2 = Timer()

//    var counter = 0.0
    var refreshInterval = 0.1
    
    
    var startTime = TimeInterval()
    var startTime2 = TimeInterval()
    
    var elapsedTime = 0.0
    var elapsedTime2 = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //countingLabel.text = toTimeString(time: counter)
    }


    @IBAction func startBothButton(_ sender: Any) {
        if !timer.isValid && !timer2.isValid {
            startButton(UIButton.self)
            startButton2(UIButton.self)
        }
    }
    
    @IBAction func startButton(_ sender: Any) {
        //timer = Timer.scheduledTimer(timeInterval: refreshInterval, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
      //  if !timer.isValid {
            startTime = NSDate.timeIntervalSinceReferenceDate
            
            timer = Timer.scheduledTimer(timeInterval: refreshInterval, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
      //  }
        
    }


    @IBAction func startButton2(_ sender: Any) {
        startTime2 = NSDate.timeIntervalSinceReferenceDate
        
        timer2 = Timer.scheduledTimer(timeInterval: refreshInterval, target: self, selector: #selector(updateTimer2), userInfo: nil, repeats: true)
        
        startButton(UIButton.self)
    }
    
    
//    @IBAction func resetButton(_ sender: Any) {
//    
//        timer.invalidate()
//        countingLabel.text = "00:00:00.00"
//        
//        //counter = 0
//        //countingLabel.text = toTimeString(time: counter)
//    }
    
    
//    func updateCounter() {
//        countingLabel.text = toTimeString(time: counter)
//        counter += refreshInterval
//    }
    
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
    
    func updateTimer2() {
        let currentTime2 = NSDate.timeIntervalSinceReferenceDate
        elapsedTime2 = currentTime2 - startTime2
        
        let hours2 = UInt8(elapsedTime2 / 3600.0)
        elapsedTime2 -= (TimeInterval(hours2) * 3600)
        
        let minutes2 = UInt8(elapsedTime2 / 60.0)
        elapsedTime2 -= (TimeInterval(minutes2) * 60)
        
        let seconds2 = UInt8(elapsedTime2)
        elapsedTime2 -= TimeInterval(seconds2)
        
        let fraction2 = UInt8(elapsedTime2 * 100)
        
        let timeString = String(format:"%02i:%02i:%02i.%02i", hours2, minutes2, seconds2, fraction2)
        
        timer2Label.text = timeString
    }
    
    
//    func toTimeString(time: Double) -> String {
//        let hours = Int(time) / 3600
//        let minutes = Int(time) / 60 % 60
//        let seconds = Int(time) % 60
//        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
//    }
    
}

