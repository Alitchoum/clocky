//
//  TimerViewModel.swift
//  clocky
//
//  Created by alize suchon on 11/12/2025.
//

import SwiftUI

@Observable
class TimerViewModel {
    
    private var timer: Timer?
    var isPlaying: Bool = false
    var isFinished: Bool = false
    var timeRemaining: Int = 0
    
    var cycles: [String] = ["Prep time","round time","Rest time", "Nb of rounds"]
    
    //Ajout vibrations
    //    func lightVibration() {
    //        let generator = UIImpactFeedbackGenerator(style: .light)
    //        generator.impactOccurred() //declenche la vibration
    //    }
    
    func startTimer() {
        var current = 0
        timer?.invalidate()
        isPlaying = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                current += 1
            } else {
                self.stopTimer()
            }
        }
    }
    
    func pauseTimer() {
           self.timer?.invalidate()
           isPlaying = false
       }
    
    func stopTimer() {
           self.timer?.invalidate()
           self.isFinished = true
           isPlaying = false
       }
}
