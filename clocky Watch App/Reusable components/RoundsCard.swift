//
//  RoundsCard.swift
//  clocky Watch App
//
//  Created by Samara Lima da Silva on 11/12/2025.
//

import SwiftUI

struct RoundsCard: View {
        var roundValue: RoundValue
        
        var body: some View {
            HStack {
                Text("N° of\nRounds")
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                Circle()
                    .fill(roundValue.hasChosen ? Color.red : Color.black)
                    .frame(width: 36, height: 36)
                    .overlay(
                        Text(roundValue.hasChosen ? "\(roundValue.count)" : "→")
                            .foregroundColor(.white)
                    )
            }
            .padding()
            .frame(height: 80)
            .background(Color.gray)
            .cornerRadius(18)
        }
    }


#Preview {
    struct Preview: View {
    @State var roundValue = RoundValue(count: 5, hasChosen: false)

        var body: some View {
            RoundsCard(roundValue: roundValue )
        }
    }

    return Preview()
}

