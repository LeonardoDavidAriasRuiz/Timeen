//
//  RuteLastTestButton.swift
//  Timeen
//
//  Created by Leonardo on 27/02/24.
//

import SwiftUI

struct RouteLastTestButton: View {
    let test: Test
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                ZStack {
                    coloredBase
                    lottieIcon
                }
                
                number
            }
        }
    }
    
    
    var lottieIcon: some View {
        Section {
            LottieIcon(name: test.testType.lottieIconName)
                .rotation3DEffect(
                    .degrees(test.testType == .antonym || test.testType == .conjugation ? 45 : 0),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
        }
    }
    
    var coloredBase: some View {
        Image(systemName: "circle.fill")
            .foregroundStyle(EllipticalGradient(gradient: Gradient(colors: [.white, test.testType.color])))
            .rotation3DEffect(
                .degrees(45),
                axis: (x: 1.0, y: 0.0, z: 0.0)
            )
            .font(.system(size: 80))
            .shadow(color: test.testType.darColor, radius: 0, x: 0.0, y: 7)
            .shadow(radius: 2, x: 0.0, y: 4)
    }
    
    var number: some View {
        Text("\(test.number)")
            .bold()
            .font(.largeTitle)
            .foregroundStyle(test.testType.darColor)
    }
    
//    var rotation3d: some ViewModifier {
//        .rotation3DEffect(.degrees(45), axis: (x: 1.0, y: 0.0, z: 0.0))
//    }
}

#Preview {
    RouteLastTestButton(test: Test(number: 2, testType: .complete, questions: []), action: {})
}
