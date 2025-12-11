//
//  RoundDetailView.swift
//  clocky Watch App
//
//  Created by Samara Lima da Silva on 11/12/2025.
//

import SwiftUI

struct RoundDetailView: View {
        @Binding var roundValue: RoundValue
        @Environment(\.dismiss) var dismiss
        
        var body: some View {
            VStack {
                Text("N° of Rounds")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                SingleTimePicker(rounds: $roundValue.count)
                
                Spacer()
                
                Button("Save") {
                    roundValue.hasChosen = true 
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }



#Preview {
    struct Preview: View {
        @State var roundValue = RoundValue(count: 5, hasChosen: false)
        var body: some View {
            RoundDetailView(roundValue: $roundValue)
        }
    }

    return Preview()
}
