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
            VStack{
                
            
            Text("Phase en cours")
                .font(.system(size: 16))
                .foregroundStyle(.white)
                VStack (spacing:-30){
                    
                    HStack{
                        Text("00")
                            .font(.system(size: 90, weight: .medium))
                            .tracking(5)
                            .padding(.leading, 25)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("30")
                            .font(.system(size: 36))
                            .padding(.trailing, 30)
                            .foregroundStyle(.grisClair)
                    }
                }
                HStack{
                    Text("Round 1 / 10")
                        .font(.system(size: 16))
                        .foregroundStyle(.white)
                    Spacer()
                    ZStack{
                        Circle()
                            .frame(width: 42, height: 42)
                            .glassEffect()
                       
                        Image(systemName: "play.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .padding(.leading, 2)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationBarTitle("Timer")
    }
}

#Preview {
    timerView()
}
