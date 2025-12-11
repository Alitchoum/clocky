//
//  TimeCard.swift
//  clocky Watch App
//
//  Created by Samara Lima da Silva on 11/12/2025.
//

import SwiftUI

struct TimeCard: View {
    var title: String
    var color: Color
    var time: TimeValue
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .bold()
            }
            
            Spacer()
            
            if !time.hasChosenTime {
                // Show arrow before user chooses a time
                Circle()
                    .fill(Color.black)
                    .frame(width: 36, height: 36)
                    .overlay(
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                    )
            } else {
                // Show chosen time
                HStack(spacing: 6) {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 36, height: 36)
                        .overlay(
                            Text("\(time.minute)")
                                .foregroundColor(.white)
                        )
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 36, height: 36)
                        .overlay(
                            Text("\(time.second)")
                                .foregroundColor(.white)
                        )
                }
            }
        }
        .padding()
        .frame(height: 80)
        .background(color)
        .cornerRadius(18)
    }
}

#Preview {
    TimeCard(title: "Testing Title",
             color: .gray,
             time: TimeValue(minute: 10, second: 0, hasChosenTime: true))
}

