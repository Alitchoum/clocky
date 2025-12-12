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
        NavigationStack{
            ZStack {
                
                //conversion minutes / secondes
                let minutes : Int = timerVM.timeRemaining / 60
                let seconds : Int = timerVM.timeRemaining % 60
                
                GeometryReader { geo in
                    let screenBounds = WKInterfaceDevice.current().screenBounds
                    let height = screenBounds.height
                    
                    let phase = timerVM.phases[timerVM.currentPhaseIndex]
                    let total = Double(phase.totalSeconds)
                    let progress = total > 0 ? 1 - (Double(timerVM.timeRemaining) / total) : 0
                    
                    VStack {
                        Spacer()
                        Rectangle()
                            .fill(phase.color)
                            .frame(height: height * progress)
                            .animation(.linear(duration: 1), value: progress)
                    }
                    .id(timerVM.currentPhaseIndex)
                }
                .ignoresSafeArea()
                
                VStack{
                    
                    Text("\(timerVM.phaseText)")
                        .font(.system(size: 16))
                        .foregroundStyle(.white)
                    
                    //TIMER
                    VStack(spacing: -30){
                        HStack{
                            Text(String(format: "%02d", minutes))
                                .font(.system(size: 98, weight: .medium))
                                .tracking(5)
                                .foregroundStyle(.white)
                                .padding(.leading, 10)
                                .scaleEffect(timerVM.isPlaying ? 1.05 : 1.0)
                                    .animation(.easeInOut(duration: 0.2), value: timerVM.timeRemaining)
                            Spacer()
                        }
                        
                        HStack{
                            Spacer()
                            if timerVM.phaseText != "Rest Time"{
                                Text(String(format: "%02d", seconds))
                                    .font(.system(size: 42))
                                    .foregroundStyle(.grisClair)
                                    .padding(.trailing, 10)
                                    .scaleEffect(timerVM.isPlaying ? 1.05 : 1.0)
                                        .animation(.easeInOut(duration: 0.2), value: timerVM.timeRemaining)
                            } else {
                                Text(String(format: "%02d", seconds))
                                    .font(.system(size: 42))
                                    .foregroundStyle(.white)
                                    .padding(.trailing, 10)
                                    .scaleEffect(timerVM.isPlaying ? 1.05 : 1.0)
                                        .animation(.easeInOut(duration: 0.2), value: timerVM.timeRemaining)
                            }
                        }
                    }
                    
                    //round/ button play
                    HStack{
                        Text("Round \(timerVM.currentRound) / \(timerVM.workoutVM.rounds)")
                            .font(.system(size: 16))
                            .foregroundStyle(.white)
                        Spacer()
                        Button{
                            timerVM.playPause()
                        }label: {
                            ZStack{
                                Circle()
                                    .frame(width: 52, height: 52)
                                    .glassEffect()
                                
                                Image(systemName: timerVM.isPlaying ? "pause.fill" : "play.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18, height: 18)
                                    .padding(.leading, 2)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
        .navigationDestination(isPresented: $timerVM.isFinish) {
                        WellDoneView()
                    }
        
        
        //TODO: rempplacer le onAppear avec le bouton play pause -> même fonction à utiliser
        //        .onAppear { timerVM.start() }
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
        prepSeconds: 5,
        roundSeconds: 5,
        restSeconds: 5,
        rounds: 2
    )
    
    WorkoutView(timerVM: TimerViewModel(phases: phases, workoutVM: WorkoutViewModel()))
}
