//
//  StreakAnimatedIcon.swift
//  Timeen
//
//  Created by Leonardo on 21/04/24.
//

import SwiftUI

struct StreakAnimatedIcon: View {
    @State private var colors: [Color] = [ Color.red, Color.yellow]
    
    var body: some View {
        Image(systemName: "flame")
            .foregroundStyle(Gradient(colors: colors))
            .onAppear(perform: fireAnimation)
    }
    
    private func fireAnimation() {
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true).speed(3)) {
            colors = [ Color.orange ]
            
        }
    }
}

#Preview {
    StreakAnimatedIcon()
        .font(.system(size: 200))
}
