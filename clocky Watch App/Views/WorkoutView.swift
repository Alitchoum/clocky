//
//  WorkoutView.swift
//  clocky Watch App
//
//  Created by Samara Lima da Silva on 11/12/2025.
//

import SwiftUI

struct WorkoutView: View {
    let prepSeconds: Int
    let roundSeconds: Int
    let restSeconds: Int
    let rounds: Int
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Prep: \(prepSeconds)s")
            Text("Round: \(roundSeconds)s")
            Text("Rest: \(restSeconds)s")
            Text("Rounds: \(rounds)")
            
            Text("Total: \( (prepSeconds + roundSeconds + restSeconds) * rounds )s")
                .bold()
                .padding(.top)
        }
        .navigationTitle("Workout")
    }
}


#Preview {
    WorkoutView(
        prepSeconds: 10,
        roundSeconds: 30,
        restSeconds: 15,
        rounds: 5
    )
}
