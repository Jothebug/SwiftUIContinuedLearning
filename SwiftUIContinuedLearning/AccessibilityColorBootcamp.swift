//
//  AccessibilityColorBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 9/11/24.
//

import SwiftUI

struct AccessibilityColorBootcamp: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var invertColors
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Button 1") {
                    
                }
                .foregroundColor(.primary)
                .buttonStyle(.borderedProminent)
                
                Button("Button 2") {
                    
                }
                .foregroundColor(colorSchemeContrast == .increased ? .white :.primary)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                
                Button("Button 3") {
                    
                }
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Button("Button 4") {
                    
                }
                .foregroundColor(differentiateWithoutColor ? .white : .primary)
                .buttonStyle(.borderedProminent)
                .tint(differentiateWithoutColor ? .black : .purple)
            }
            .font(.largeTitle)
//            .navigationTitle("Hi")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(reduceTransparency ? Color.black :Color.black.opacity(0.5))
        }
    }
}

#Preview {
    AccessibilityColorBootcamp()
}
