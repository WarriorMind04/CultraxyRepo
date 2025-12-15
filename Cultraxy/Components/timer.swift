//
//  timer.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 12/12/25.
//

import SwiftUI
import Combine

struct timer: View {
    @State var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        HStack{
            Text("You have:")
            Text("\(timeRemaining)")
                        .onReceive(timer) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            }
                        }
                        .bold()
                        .font(.largeTitle)
                        .padding() 
            Text("seconds left")
        }
           }
}

#Preview {
    timer()
}
