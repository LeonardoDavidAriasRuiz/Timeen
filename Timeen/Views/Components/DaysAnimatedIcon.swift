//
//  DaysAnimatedIcon.swift
//  Timeen
//
//  Created by Leonardo on 24/04/24.
//

import SwiftUI

struct DaysAnimatedIcon: View {
    @State private var colors: [Color] = [ Color(.yellow), Color(.red), Color(.blue)]
    
    var body: some View {
        Image(systemName: "sun.haze.fill")
            .foregroundStyle(Gradient(colors: colors))
            .onAppear(perform: fireAnimation)
    }
    
    private func fireAnimation() {
        withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
            colors = [ Color(.yellow), Color(.yellow), Color.blue ]
            
        }
    }
}

#Preview {
    DaysAnimatedIcon()
        .font(.system(size: 300))
}
