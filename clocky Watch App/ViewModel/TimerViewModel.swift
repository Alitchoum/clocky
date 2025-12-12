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
    var phases: [Phase] = []
    
    var currentPhaseIndex: Int = 0
    var timeRemaining: Int = 0
    var color: Color = .clear
    
    var timer: Timer?
    var startDate: Date = .now
    
    init(phases: [Phase], workoutVM : WorkoutViewModel) {
        self.workoutVM = workoutVM
        self.phases = phases
        loadPhase(at: 0)
    }
    
    //pour démarrer une phase -> compte si la phase actuelle est compris dans le nombre de phase total
    func loadPhase(at index: Int) {
        guard index < phases.count else {
            stopTimer()
            return
        }
    //phase actuelle parmis l'ensemble de phase
        currentPhaseIndex = index
        let phase = phases[index]
        
    //le total de seconde + la couleur dans la phase actuelle en partant de maintenant
        timeRemaining = phase.totalSeconds
        color = phase.color
        startDate = .now
    }
    
    func start() {
        stopTimer()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.tick()
        }
    }
    
    // le temps qui passe -> retire 1 seconde des secondes restantes dans la phase
    func tick() {
        timeRemaining -= 1
        
        //passe à la phase suivante si 0 secondes restantes
        if timeRemaining <= 0 {
            nextPhase()
        }
    }
    
    //passe à la phase suivante en changeant d'index de l'ensemble des phases
    func nextPhase() {
        loadPhase(at: currentPhaseIndex + 1)
    }
    
    //pour stopper le timer
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    //MARK: - Mise en place d'une phase de préparation + phases d'entrainements
    
    let workoutVM : WorkoutViewModel
    
    func workoutPhases() -> [Phase] {

        // Phase de préparation (une seule)
        phases.append(
            Phase(type: .prep, totalSeconds: workoutVM.prepSeconds, color: .gris)
        )
        
        // Round + Rest répétés
        for _ in 0..<workoutVM.rounds {
            phases.append(
                Phase(type: .round, totalSeconds: workoutVM.roundSeconds, color: .rouge)
            )
            phases.append(
                Phase(type: .rest, totalSeconds: workoutVM.restSeconds, color: .grisClair)
            )
        }
        
        return phases
    }
    
    
}
