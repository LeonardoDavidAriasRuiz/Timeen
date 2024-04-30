//
//  BodyView.swift
//  Timeen
//
//  Created by Leonardo on 14/02/24.
//

import SwiftUI
import Lottie

struct BodyView: View {
    @StateObject private var bodyVM = BodyViewModel()
    @State var playbackModeHome: LottiePlaybackMode = .paused(at: .time(0))
    @State var playbackModeAccount: LottiePlaybackMode = .paused(at: .time(0))
    @State var playbackModeStatistics: LottiePlaybackMode = .paused(at: .time(0))
    
    var body: some View {
        bodyVM.viewShowing.view
            .environmentObject(bodyVM)
    }
}

#Preview {
    BodyView()
        .environmentObject(IsLoadingViewModel())
        .environmentObject(AuthenticationViewModel())
}

struct BottomMenu: View {
    @EnvironmentObject private var bodyVM: BodyViewModel
    
    var body: some View {
        HStack {
            ForEach(BodyViews.allCases, id: \.self) { bodyV in
                Button(action: {showView(view: bodyV)}) {
                    LottieIcon(name: bodyV.name, speed: 0.4, size: 40, playMode: bodyVM.viewShowing == bodyV ? .loop : .paused)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
    private func showView(view: BodyViews) {
        switch view {
            case .home: bodyVM.viewShowing = .home
            case .statistics: bodyVM.viewShowing = .statistics
            case .account: bodyVM.viewShowing = .account
        }
    }
}
