//
//  SoundBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by HaYen on 14/10/24.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case badum = "badum"
        case cowMoo = "cowMoo"
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error  {
            print("Error 2playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                SoundManager.instance.playSound(sound: .cowMoo)
            }
            Button("Play sound 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

#Preview {
    SoundBootcamp()
}
