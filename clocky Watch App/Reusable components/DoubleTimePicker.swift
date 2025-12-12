//
//  DoubleTimePicker.swift
//  clocky Watch App
//
//  Created by Samara Lima da Silva on 11/12/2025.
//

import SwiftUI

struct DoubleTimePicker: View {
    @Binding var minute: Int
    @Binding var second: Int
    
    private let values = Array(0...59)

    var body: some View {
        HStack(spacing: 4) {
            Picker("", selection: $minute) {
                ForEach(values, id: \.self) { value in
                    Text("\(value)")
                }
            }
            .pickerStyle(.wheel)
            .pickerStyle(WheelPickerStyle())

            Text(":")

            Picker("", selection: $second) {
                ForEach(values, id: \.self) { value in
                    Text("\(value)")
                }
            }
            .pickerStyle(.wheel)
        }
        .frame(width: 141, height: 95)
        HStack{
            Text("Min")
            Spacer()
            Text("Sec")
        }
        .font(.footnote)
        .frame(width: 103)
    }
}


#Preview {
    struct Preview: View {
        @State var minute = 10
        @State var second = 13
        var body: some View {
            DoubleTimePicker(minute:$minute, second: $second)
        }
    }

    return Preview()
}
