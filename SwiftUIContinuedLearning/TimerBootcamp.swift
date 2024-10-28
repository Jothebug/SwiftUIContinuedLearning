//
//  TimerBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 28/10/24.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // Current time
//    @State var currentDate: Date = Date()
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.timeStyle = .medium
//        return formatter
//    }
    
    // Countdown
    @State var count: Int = 10
    @State var finishedText: String? = nil
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(.purple), Color(.lightGray)]),
                center: .center,
                startRadius: 5,
                endRadius: 500)
            .ignoresSafeArea()
            
            Text(finishedText ?? "\(count)")
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        .onReceive(timer, perform: { _ in
            if count <= 1 {
                finishedText = "Wow!"
            } else {
                count -= 1
            }
        })
    }
}

#Preview {
    TimerBootcamp()
}
