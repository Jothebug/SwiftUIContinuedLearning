//
//  AccessibilityTextBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 7/11/24.
//

import SwiftUI

struct AccessibilityTextBootcamp: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) {_ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 20)) // set fixed size for text or image
                            Text("Welcome to my app")
                        }
                        .font(.title)
                        Text("This is some longer text that expands to multiple line.")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .background(.red)
                    .truncationMode(.tail)
                    .lineLimit(3)
                    .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Hello world")
        }
    }
}

extension ContentSizeCategory {
    var customMinScaleFactor: CGFloat {
        switch self {
            case .extraSmall, .small, .medium:
                return 1.0
            case .large, .extraLarge, .extraExtraLarge:
                return 0.8
            default:
                return 0.6
        }
    }
}

#Preview {
    AccessibilityTextBootcamp()
}
