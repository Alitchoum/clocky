//
//  PhaseTypeModel.swift
//  clocky Watch App
//
//  Created by Carla on 11/12/2025.
//

import Foundation
import SwiftUI

enum PhaseType {
    case prep, round, rest
}

struct Phase {
    let type: PhaseType
    let totalSeconds: Int
    let color: Color
}
