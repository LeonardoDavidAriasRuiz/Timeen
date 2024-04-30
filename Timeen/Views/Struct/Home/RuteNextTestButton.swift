//
//  RuteNextTestButton.swift
//  Timeen
//
//  Created by Leonardo on 27/02/24.
//

import SwiftUI

struct RouteNextTestButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                starDot
                text
            }
        }
    }
    
    var starDot: some View {
        Image(systemName: "star.circle.fill")
            .foregroundStyle(EllipticalGradient(gradient: Gradient(colors: [.lightRed, .red])))
            .rotation3DEffect(
                .degrees(45),
                axis: (x: 1.0, y: 0.0, z: 0.0)
            )
            .font(.system(size: 120))
            .shadow(color: Color(.darkRed), radius: 0, x: 0.0, y: 1)
            .shadow(color: Color(.darkRed), radius: 0, x: 0.0, y: 2)
            .shadow(color: Color(.darkRed), radius: 0, x: 0.0, y: 2)
            .shadow(color: Color(.darkRed), radius: 0, x: 0.0, y: 2)
            .shadow(radius: 2, x: 0.0, y: 4)
    }
    
    var text: some View {
        Text("Nueva")
            .font(.title2)
            .bold()
            .foregroundStyle(.red)
    }
}

#Preview {
    RouteNextTestButton(action: {})
}
