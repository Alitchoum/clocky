//
//  WorkoutView.swift
//  clocky Watch App
//
//  Created by Samara Lima da Silva on 11/12/2025.
//

import SwiftUI
import WatchKit

struct WorkoutView: View {
    @State var timerVM: TimerViewModel
       
       var body: some View {
           ZStack {
               GeometryReader { geo in
                   let screenBounds = WKInterfaceDevice.current().screenBounds
                   let height = screenBounds.height
                   
                   let phase = timerVM.phases[timerVM.currentPhaseIndex]
                   let total = Double(phase.totalSeconds)
                   let progress = total >= 0 ? 1 - (Double(timerVM.timeRemaining) / total) : 0
                   
                   VStack {
                       Spacer()
                       Rectangle()
                           .fill(phase.color)
                           .frame(height: height * progress)
                           .animation(.linear(duration: 1), value: timerVM.timeRemaining)
                   }
               }
               .ignoresSafeArea()
               
               Text("\(timerVM.timeRemaining)")
                   .font(.largeTitle)
                   .foregroundStyle(.white)
           }
           
           //TODO: rempplacer le onAppear avec le bouton play pause -> même fonction à utiliser
           .onAppear { timerVM.start() }
       }
}

func workoutPhases(
    prepSeconds: Int,
    roundSeconds: Int,
    restSeconds: Int,
    rounds: Int
) -> [Phase] {
    
    var phases: [Phase] = []
    
    // Phase de préparation (une seule)
    phases.append(
        Phase(type: .prep, totalSeconds: prepSeconds, color: .gris)
    )
    
    // Round + Rest répétés
    for _ in 0..<rounds {
        phases.append(
            Phase(type: .round, totalSeconds: roundSeconds, color: .rouge)
        )
        phases.append(
            Phase(type: .rest, totalSeconds: restSeconds, color: .grisClair)
        )
    }
    
    return phases
}


#Preview {
    let phases = workoutPhases(
        prepSeconds: 10,
        roundSeconds: 30,
        restSeconds: 15,
        rounds: 5
    )

    
    WorkoutView(timerVM: TimerViewModel(phases: phases, workoutVM: WorkoutViewModel()))
}
