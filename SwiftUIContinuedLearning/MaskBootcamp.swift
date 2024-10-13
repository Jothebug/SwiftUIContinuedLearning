//
//  MaskBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 13/10/24.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 0

    var body: some View {
        ZStack {
            starsView
                .overlay(overlayView.mask(starsView))
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.yellow)
                    .frame(width: CGFloat(rating / 5) * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(rating >= index ? Color.yellow : .gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }

    }
}

#Preview {
    MaskBootcamp()
}
