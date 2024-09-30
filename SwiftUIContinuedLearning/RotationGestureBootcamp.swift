//
//  RotationGestureBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 30/9/24.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    @State var angle: Angle = Angle(degrees: 0)
    var body: some View {
        Text("Jothebug")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
