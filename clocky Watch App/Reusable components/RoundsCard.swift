//
//  RoundsCard.swift
//  clocky Watch App
//
//  Created by Samara Lima da Silva on 11/12/2025.
//

import SwiftUI

struct RoundsCard: View {
        @Binding var roundValue: RoundValue
        
        var body: some View {
            HStack {
                Text("N°of\nRounds")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                
                Spacer()
                
                Circle()
                    .fill(roundValue.hasChosen ? Color.black : Color.black)
                    .frame(width: 36, height: 36)
                    .overlay(
                        Text(roundValue.hasChosen ? "\(roundValue.count)" : "→")
                            .foregroundColor(.white)
                    )
            }
            .padding()
            .frame(height: 90)
            .frame(maxWidth: .infinity)
            .background(Color.rouge)
            .cornerRadius(18)
        }
    }


#Preview {
    struct Preview: View {
    @State var roundValue = RoundValue(count: 5, hasChosen: true)

        var body: some View {
            RoundsCard(roundValue: $roundValue )
        }
    }

    return Preview()
}

