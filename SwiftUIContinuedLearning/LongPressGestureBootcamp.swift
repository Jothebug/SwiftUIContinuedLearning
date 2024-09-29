//
//  LongPressGestureBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 29/9/24.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isCompleteSample1: Bool = false
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        VStack {
            // basic sample
            Text(isCompleteSample1 ? "completed".uppercased() : "not complete".uppercased())
                .padding()
                .padding(.horizontal)
                .background(isCompleteSample1 ? Color.green : Color.gray)
                .cornerRadius(10)
                .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                    isCompleteSample1.toggle()
                }
            
            // advanced sample
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { (isPressing) in
                        // start of press -> min duration
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    } perform: {
                        // at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }
                
                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
    }
}

#Preview {
    LongPressGestureBootcamp()
}
