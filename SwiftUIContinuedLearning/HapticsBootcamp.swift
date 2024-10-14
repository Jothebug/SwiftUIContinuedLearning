//
//  HapticsBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 14/10/24.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager() // singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("success") {HapticManager.instance.notification(type: .success)}
            Button("warning") {HapticManager.instance.notification(type: .warning)}
            Button("error") {HapticManager.instance.notification(type: .error)}
            Divider()
            Button("soft") { HapticManager.instance.impact(style: .soft)}
            Button("light") { HapticManager.instance.impact(style: .light)}
            Button("heavy") { HapticManager.instance.impact(style: .heavy)}
            Button("medium") { HapticManager.instance.impact(style: .medium)}
        }
    }
}

#Preview {
    HapticsBootcamp()
}
