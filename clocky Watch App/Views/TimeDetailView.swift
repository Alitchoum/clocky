//
//  TimeDetailView.swift
//  clocky Watch App
//
//  Created by Samara Lima da Silva on 11/12/2025.
//

import SwiftUI

struct TimeDetailView: View {
    @Binding var time: TimeValue
    @Environment(\.dismiss) var dismiss
    
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .bold()
            
            Spacer()
            
            DoubleTimePicker(minute: $time.minute, second: $time.second)
            
            Spacer()
            
            Button("Save") {
                time.hasChosenTime = true   
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}


#Preview {
    struct Preview: View {
        @State var time = TimeValue(minute: 10, second: 0, hasChosenTime: true)
        var body: some View {
            TimeDetailView(time: $time, title: "Testing")
        }
    }
    return Preview()
}
