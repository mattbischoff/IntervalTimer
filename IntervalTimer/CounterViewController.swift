//
//  CounterViewController.swift
//  IntervalTimer
//
//  Created by Matthew Bischoff on 4/16/16.
//  Copyright © 2016 Lickability. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {

    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    
    var secondsRemaining = 20
    var timer: Timer?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateSecondsLabel()
    }
    
    @IBAction func startStopButtonTapped(_ sender: AnyObject) {
        if timer != nil {
            // stop
            timer?.invalidate()
            timer = nil
            startStopButton.setTitle("START", for: UIControlState())
        }
        else {
            // start
            startStopButton.setTitle("STOP", for: UIControlState())
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decrementCounter), userInfo: nil, repeats: true)
        }
    }
    
    func decrementCounter() {
        guard secondsRemaining > 0 else {
            timer?.invalidate()
            return
        }
        
        secondsRemaining = secondsRemaining - 1
        
        updateSecondsLabel()
    }
    
    func updateSecondsLabel() {
        secondsLabel.text = String(secondsRemaining)
    }
}

