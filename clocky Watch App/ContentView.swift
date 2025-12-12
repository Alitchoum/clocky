//
//  ContentView.swift
//  clocky Watch App
//
//  Created by alize suchon on 11/12/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var vm = WorkoutViewModel()
    @State private var navigateToWorkout = false
    
    private var phases: [Phase] {
        workoutPhases(
            prepSeconds: vm.prepSeconds,
            roundSeconds: vm.roundSeconds,
            restSeconds: vm.restSeconds,
            rounds: vm.rounds
        )
    }
     
    private var timerVM: TimerViewModel {
        TimerViewModel(phases: phases, workoutVM: vm)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 10) {
                    
                    NavigationLink {
                        TimeDetailView(time: $vm.prepTime, title: "Prep Time")
                    } label: {
                        TimeCard(title: "Prep\nTime",
                                 color: Color(.grisClair),
                                 colorSeconds: Color(.rouge),
                                 time: $vm.prepTime)
                    }
                    
                    NavigationLink {
                        TimeDetailView(time: $vm.roundTime, title: "Round Time")
                    } label: {
                        TimeCard(title: "Round\nTime",
                                 color: Color(.rouge),
                                 colorSeconds: Color(.grisClair),
                                 time: $vm.roundTime)
                    }
                    
                    NavigationLink {
                        TimeDetailView(time: $vm.restTime, title: "Rest Time")
                    } label: {
                        TimeCard(title: "Rest\nTime",
                                 color: Color(.gris),
                                 colorSeconds: Color(.rouge),
                                 time: $vm.restTime)
                    }
                    
                    NavigationLink {
                        RoundDetailView(roundValue: $vm.roundValue)
                    } label: {
                        RoundsCard(roundValue: $vm.roundValue)
                    }
                    
                    Text("Session's total time: \(vm.totalSessionFormatted)")
                    
                    Button("Start") {
                        navigateToWorkout = true
                    }
                    .frame(width: 151, height: 38)
                    .cornerRadius(25)
                    .buttonStyle(.borderedProminent)
                    .tint(.rouge)
                    
                }
                .buttonStyle(.plain)
                .padding(.horizontal)
                .navigationDestination(isPresented: $navigateToWorkout) {
                    WorkoutView(timerVM: timerVM)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
