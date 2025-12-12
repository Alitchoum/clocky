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
    var colorSeconds: Color
    @Binding var time: TimeValue
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)

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
                HStack(spacing: -8) {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 36, height: 36)
                        .overlay(
                            Text("\(time.minute)")
                                .foregroundColor(.white)
                        )
                    
                    Circle()
                        .fill(colorSeconds)
                        .frame(width: 36, height: 36)
                        .overlay(
                            Text("\(time.second)")
                                .foregroundColor(.black)
                        )
                }
            }
        }
        .padding()
        .frame(height: 90)
        .frame(maxWidth: .infinity)
        .background(color)
        .cornerRadius(18)
    }
}

#Preview {
    struct Preview: View {
        @State var timeValue = TimeValue(minute: 4, second: 30, hasChosenTime: true)
        var body: some View {
            TimeCard(title: "Testing\n Title",
                     color: .gray,
                     colorSeconds: .rouge,
                     time: $timeValue)
        }
    }
    return Preview()
}
