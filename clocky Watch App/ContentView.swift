//
//  ContentView.swift
//  clocky Watch App
//
//  Created by alize suchon on 11/12/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var prepTime = TimeValue()
    @State private var roundTime = TimeValue()
    @State private var restTime = TimeValue()
    @State private var roundValue = RoundValue()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 12) {
                    
                    NavigationLink {
                        TimeDetailView(time: $prepTime, title: "Prep Time")
                    } label: {
                        TimeCard(title: "Prep\nTime",
                                 color: Color(.lightGray),
                                 time: prepTime)
                    }
                    
                    NavigationLink {
                        TimeDetailView(time: $roundTime, title: "Round Time")
                    } label: {
                        TimeCard(title: "Round\nTime",
                                 color: .red,
                                 time: roundTime)
                    }
                    
                    NavigationLink {
                        TimeDetailView(time: $restTime, title: "Rest Time")
                    } label: {
                        TimeCard(title: "Rest\nTime",
                                 color: Color(.lightGray),
                                 time: restTime)
                    }
                    
                    NavigationLink {
                        RoundDetailView(roundValue: $roundValue)
                    } label: {
                        RoundsCard(roundValue: roundValue)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


#Preview {
    ContentView()
}
