//
//  TestsAnimatedIcon.swift
//  Timeen
//
//  Created by Leonardo on 22/04/24.
//

import SwiftUI

struct TestsAnimatedIcon: View {
    @State private var colors: [Color] = [ Color(.red), Color.purple]
    
    var body: some View {
        Image(systemName: "point.bottomleft.forward.to.point.topright.scurvepath.fill")
            .foregroundStyle(Gradient(colors: colors))
            .onAppear(perform: fireAnimation)
    }
    
    private func fireAnimation() {
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
            colors = [ Color(.red) ]
            
        }
    }
}

#Preview {
    TestsAnimatedIcon()
        .font(.system(size: 200))
}
