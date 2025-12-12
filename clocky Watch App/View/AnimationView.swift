//
//  AnimationView.swift
//  clocky Watch App
//
//  Created by Carla on 11/12/2025.
//

//import SwiftUI
//
//struct AnimationView: View {
//    
//    let phases = workoutPhases(prepSeconds: 10, roundSeconds: 120, restSeconds: 20, rounds: 6)
//    
//    private var viewModel: TimerViewModel {
//        TimerViewModel(phases: phases, workoutVM: <#WorkoutViewModel#>)
//    }
//    @State var timeValue = TimeValue()
//    
//    var body: some View {
//        ZStack {
//            GeometryReader { geo in
//                let height = geo.size.height
//                let progress = timeValue.totalTime > 0 ? 1 - (viewModel.timeRemaining / timeValue.totalTime) : 0
//                
//                VStack {
//                    Rectangle()
//                        .foregroundStyle(viewModel.color)
//                        .frame(height: height * CGFloat(progress))
//                        .animation(.linear(duration: TimeInterval(viewModel.timeRemaining)), value: viewModel.timeRemaining)
//                }
//            }.ignoresSafeArea()
//        }
//    }
//}
//
//#Preview {
//    AnimationView()
//}
