//
//  SingleTimePicker.swift
//  clocky Watch App
//
//  Created by Samara Lima da Silva on 11/12/2025.
//

import SwiftUI

struct SingleTimePicker: View {
    @Binding var rounds: Int

    private let values = Array(0...50)

    var body: some View {
        HStack(spacing: 4) {
            Picker("", selection: $rounds) {
                ForEach(values, id: \.self) { value in
                    Text("\(value)")
                }
            }
            .pickerStyle(.wheel)
        }
        .frame(width: 141, height: 95)
    }
}


#Preview {
    struct Preview: View {
        @State var rounds = 5

        var body: some View {
            SingleTimePicker(rounds: $rounds)
        }
    }

    return Preview()
}
