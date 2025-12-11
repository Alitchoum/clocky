//
//  timerView.swift
//  clocky
//
//  Created by alize suchon on 11/12/2025.
//

import SwiftUI

struct timerView: View {
    
    var body: some View {
        NavigationStack{
            VStack (spacing:-30){
                Text("")
                HStack{
                    Text("10")
                        .font(.system(size: 90, weight: .semibold))
                        .padding(.leading, 40)
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text("00")
                        .font(.system(size: 36))
                        .padding(.trailing, 40)
                        .foregroundStyle(.grisClair)
                }
            }
        }
        .navigationBarTitle("Timer")
    }
}

#Preview {
    timerView()
}
