//
//  ColoredBackground.swift
//  Timeen
//
//  Created by Leonardo on 31/03/24.
//

import SwiftUI

struct ColoredBackground: View {
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    @State var colors: [Color]
    @State var hidedColors: [Color]
    
    @State private var startPoints = [
        UnitPoint.bottom,
        UnitPoint.bottomTrailing,
        UnitPoint.trailing,
        UnitPoint.topTrailing,
        UnitPoint.top,
        UnitPoint.topLeading,
        UnitPoint.leading,
        UnitPoint.bottomLeading
    ]
    
    @State private var endPoints = [
        UnitPoint.topLeading,
        UnitPoint.leading,
        UnitPoint.bottomLeading,
        UnitPoint.bottom,
        UnitPoint.bottomTrailing,
        UnitPoint.trailing,
        UnitPoint.topTrailing,
        UnitPoint.top
    ]
    
    var body: some View {
        LinearGradient(
            colors: colors,
            startPoint: startPoints.first ?? .top,
            endPoint: endPoints.first ?? .bottom
        )
        .ignoresSafeArea()
        .onAppear(perform: rotateColors)
        .onReceive(timer, perform: {_ in rotateColors()})
    }
    
    private func rotateColors() {
        withAnimation(.smooth(duration: 10)) {
            hidedColors.append(colors.removeFirst())
            colors.append(hidedColors.removeFirst())
        }
        withAnimation(.smooth(duration: 20)) {
            startPoints.append(startPoints.removeFirst())
            endPoints.append(endPoints.removeFirst())
        }
    }
}

#Preview {
    ColoredBackground(colors: [.black, .blue], hidedColors: [Color(.blueGreen), Color(.green), Color(.yellow).darker(), Color(.orange), Color(.red), Color(.purple)])
}

//struct ColoredBackground: View {
//    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
//    
//    @State var colors: [Color] = [.black, .blue]
//    @State var hidedColor: Color = Color(.blueGreen)
//    
//    @State private var startPoints = [
//        UnitPoint.bottom,
//        UnitPoint.bottomTrailing,
//        UnitPoint.trailing,
//        UnitPoint.topTrailing,
//        UnitPoint.top,
//        UnitPoint.topLeading,
//        UnitPoint.leading,
//        UnitPoint.bottomLeading
//    ]
//    
//    @State private var endPoints = [
//        UnitPoint.topLeading,
//        UnitPoint.leading,
//        UnitPoint.bottomLeading,
//        UnitPoint.bottom,
//        UnitPoint.bottomTrailing,
//        UnitPoint.trailing,
//        UnitPoint.topTrailing,
//        UnitPoint.top
//    ]
//    
//    var body: some View {
//        LinearGradient(
//            colors: colors,
//            startPoint: startPoints.first ?? .top,
//            endPoint: endPoints.first ?? .bottom
//        )
//        .ignoresSafeArea()
//        .onAppear(perform: rotateColors)
//        .onReceive(timer, perform: {_ in rotateColors()})
//    }
//    
//    private func rotateColors() {
//        withAnimation(.smooth(duration: 10)) {
//            let aux = hidedColor
//            hidedColor = colors.removeFirst()
//            colors.append(aux)
//        }
//        withAnimation(.smooth(duration: 20)) {
//            startPoints.append(startPoints.removeFirst())
//            endPoints.append(endPoints.removeFirst())
//        }
//    }
//}
