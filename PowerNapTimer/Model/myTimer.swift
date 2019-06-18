//
//  myTimer.swift
//  PowerNapTimer
//
//  Created by Jason Mandozzi on 6/18/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import Foundation
// Creating the protocol
protocol myTimerDelegate: class {
    func timerCompleted()
    func timerStopped()
    func timerSecondTicked()
}

class MyTimer: NSObject {
    
    // How many seconds are remaining on our nap
    var timeRemaining: TimeInterval?
    
    // Timer object we are hiding behind our wrapper
    var timer: Timer?
    
    // creating a variable "delegat" that accesses our protocol
    weak var delegate: myTimerDelegate?
    
    // Checks if our timer is on or off
    var isOn: Bool {
        if timeRemaining != nil {
            return true
        } else {
            return false
        }
    }
    
   private func secondTicked() {
        guard let timeRemaining = timeRemaining else {return}
        if timeRemaining > 0 {
            self.timeRemaining = timeRemaining - 1
            delegate?.timerSecondTicked()
            print(timeRemaining)
        } else {
            timer?.invalidate()
            self.timeRemaining = nil
            print(timeRemaining)
        }
    }
    
    func startTimer(_ time: TimeInterval) {
        if isOn == false {
            self.timeRemaining = time
            
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                self.secondTicked()
            })
        }
    }
    
    func stopTimer() {
        if isOn {
            self.timeRemaining = nil
            timer?.invalidate()
            delegate?.timerStopped()
        }
    }
    
}
