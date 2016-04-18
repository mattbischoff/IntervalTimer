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
    var timer: NSTimer?
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        updateSecondsLabel()
    }
    
    @IBAction func startStopButtonTapped(sender: AnyObject) {
        if timer != nil {
            // stop
            timer?.invalidate()
            timer = nil
            startStopButton.setTitle("START", forState: .Normal)
        }
        else {
            // start
            startStopButton.setTitle("STOP", forState: .Normal)
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(decrementCounter), userInfo: nil, repeats: true)
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

