//
//  WorkoutViewModel.swift
//  clocky Watch App
//
//  Created by Samara Lima da Silva on 11/12/2025.
//

import Foundation

@Observable
class WorkoutViewModel {
    
    var prepTime: TimeValue = TimeValue()
    var roundTime: TimeValue = TimeValue()
    var restTime: TimeValue = TimeValue()
    var roundValue: RoundValue = RoundValue()
    
    // MARK: - Transforming everything in seconds
    
    var prepSeconds:Int {
        prepTime.minute * 60 + prepTime.second
    }
    
    var roundSeconds: Int {
        roundTime.minute * 60 + roundTime.second
    }
    
    var restSeconds: Int {
        restTime.minute * 60 + restTime.second
    }
    
    var rounds: Int {
        roundValue.count
    }
    
    // MARK: - Functions for total seconds and formating to MM:SS
    
    var totalSessionSeconds: Int {
        (prepSeconds + roundSeconds + restSeconds) * rounds
    }
    
    var totalSessionFormatted: String {
        let minutes = totalSessionSeconds / 60
        let seconds = totalSessionSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    }
