//
//  LoadingView.swift
//  Timeen
//
//  Created by Leonardo on 27/01/24.
//

import SwiftUI

struct LoadingView: View {
    @State private var timer = Timer.publish(every: 0.6, on: .main, in: .common).autoconnect()
    @State private var rotatio: Double = 0
    @State private var face: Bool = true
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(.blue))
                .frame(width: 100, height: 100)
                .offset(x: face ? 0 : -130, y: face ? -170: -70)
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(.purple))
                .frame(width: 100, height: 100)
                .offset(x: face ? -130 : 0, y: face ? -70 : -150)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(.red))
                .frame(width: 100, height: 100)
                .offset(x: face ? -130 : 0, y: face ? 70 : 150)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(.orange))
                .frame(width: 100, height: 100)
                .offset(x: face ? 0 : -130, y: face ? 170: 70)
            
            
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(.green))
                .frame(width: 200, height: 50)
                .rotationEffect(.degrees(face ? 45 : -45))
                .offset(x: 60, y: face ? 54 : -54)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(.blueGreen))
                .frame(width: 50, height: 200)
                .rotationEffect(.degrees(face ? 45 : 135))
                .offset(x: 60, y: face ? -53 : 54)
        }
        .rotationEffect(.degrees(rotatio))
        .onReceive(timer) { _ in
            withAnimation(.bouncy) {
                rotatio += 90
                face.toggle()
            }
        }
    }
}

#Preview {
    LoadingView().scaleEffect(0.5)
}
