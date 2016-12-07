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
    var counter = 0.00
    var refreshInterval = 0.05
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countingLabel.text = String(counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func startButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: refreshInterval, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
    }

    
    
    @IBAction func clearButton(_ sender: Any) {
        timer.invalidate()
        counter = 0
        countingLabel.text = String(counter)
    }
    
    
    func updateCounter() {
        countingLabel.text = String(format: "%.2f", counter)
        counter += refreshInterval
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
}

