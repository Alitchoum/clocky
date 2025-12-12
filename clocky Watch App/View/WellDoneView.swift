//
//  WellDoneView.swift
//  clocky Watch App
//
//  Created by Carla on 11/12/2025.
//

import SwiftUI

struct WellDoneView: View {
    var body: some View {
        ZStack {
            Color.rouge
                .ignoresSafeArea()
            HStack {
                
                Spacer()
                
                Text("WELL \n DONE!")
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .multilineTextAlignment(.trailing)
                    .padding(.bottom, 40)
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                    .overlay(alignment: .leading) {
                        Image(.star)
                            .padding(.top, 50)
                        
                    }
                
            }
        }
    }
}

#Preview {
    WellDoneView()
}
