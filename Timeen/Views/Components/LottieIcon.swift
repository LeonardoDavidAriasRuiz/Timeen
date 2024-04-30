//
//  LottieIcon.swift
//  Timeen
//
//  Created by Leonardo on 21/04/24.
//

import SwiftUI
import Lottie

struct LottieIcon: View {
    let name: String
    let speed: Double
    let size: CGFloat
    var playMode: lottiePlayMode
    
    init(name: String, speed: Double = 0.2, size: CGFloat = 60, playMode: lottiePlayMode = .loop) {
        self.name = name
        self.speed = speed
        self.size = size
        self.playMode = playMode
    }
    
    var body: some View {
        LottieView(animation: .named(name))
            .playbackMode(playMode.mode)
            .animationSpeed(speed)
            .frame(width: size, height: size)
    }
}

enum lottiePlayMode {
    case loop
    case paused
    
    var mode: LottiePlaybackMode {
        switch self {
            case .loop:
                return .playing(.toProgress(1, loopMode: .loop))
            case .paused:
                return .paused(at: .currentFrame)
        }
    }
}

#Preview {
    LottieIcon(name: "SadFace", speed: 0.8, size: 500)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.5))
}
