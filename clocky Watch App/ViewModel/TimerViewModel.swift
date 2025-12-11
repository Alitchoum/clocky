//
//  TimerViewModel.swift
//  clocky Watch App
//
//  Created by Carla on 11/12/2025.
//

import Foundation
import SwiftUI

@Observable
class TimerViewModel {
    var timeRemaining : Int
    var color : Color
    var startDate : Date
    
    let timeValue : TimeValue
    
    init(timeValue: TimeValue, color: Color, startDate: Date = .now) {
        self.timeValue = timeValue
        self.timeRemaining = timeValue.totalTime
        self.color = color
        self.startDate = startDate
    }
    
    
//    //MARK: Fonction progression
//    
//    func progressTime(currentTime: Double, target: Double, maxHeight: CGFloat) -> CGFloat {
//        guard target > 0 else {return 0}
//        return min(currentTime / target, 1.0) * maxHeight
//    }
}
