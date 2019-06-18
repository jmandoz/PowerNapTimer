//
//  ViewController.swift
//  PowerNapTimer
//
//  Created by Jason Mandozzi on 6/18/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var napButton: UIButton!
    
    let timer = MyTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.delegate = self
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        if timer.isOn {
            timer.stopTimer()
        } else {
            timer.startTimer(5)
        }
        updateLabel()
        updateButton()
    }
    
    func updateLabel() {
        if timer.isOn {
            timerLabel.text = "\(timer.timeRemaining)"
        } else {
            timerLabel.text = "20 : 00"
        }
    }
    
    func updateButton() {
        if timer.isOn {
            napButton.setTitle("Cancel Nap", for: .normal)
        } else {
            napButton.setTitle("Start Nap", for: .normal)
        }
    }
    
    func setTimer() {
        
    }
}

extension ViewController: myTimerDelegate {
    func timerCompleted() {
        updateLabel()
        updateButton()
        //call the display controller function
    }
    
    func timerStopped() {
        updateButton()
        updateLabel()
        timer.timer?.invalidate()
    }
    
    func timerSecondTicked() {
        updateLabel()
    }
}

extension ViewController {
    func displaySnoozeAlertController() {
        
    }
}
