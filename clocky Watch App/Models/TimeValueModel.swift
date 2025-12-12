//
//  TimeValueModel.swift
//  clocky Watch App
//
//  Created by Samara Lima da Silva on 11/12/2025.
//

import Foundation

struct TimeValue {
    var minute: Int = 0
    var second: Int = 50
    var hasChosenTime: Bool = false
    
    var totalTime : Int {
        minute + second
    }
}
