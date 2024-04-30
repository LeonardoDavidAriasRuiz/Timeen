//
//  ScoreAnimatedIcon.swift
//  Timeen
//
//  Created by Leonardo on 21/04/24.
//

import SwiftUI

struct ScoreAnimatedIcon: View {
    
    @State private var colors: [Color] = [ Color(.purple), Color(.blue)]
    
    var body: some View {
        Image(systemName: "trophy")
            .foregroundStyle(Gradient(colors: colors))
            .onAppear(perform: fireAnimation)
    }
    
    private func fireAnimation() {
        withAnimation(.easeInOut(duration: 1).delay(1.5).repeatForever(autoreverses: true)) {
            colors = [ Color.blue, Color(.blue)]
        }
    }
}

#Preview {
    ScoreAnimatedIcon()
        .font(.system(size: 200))
}
