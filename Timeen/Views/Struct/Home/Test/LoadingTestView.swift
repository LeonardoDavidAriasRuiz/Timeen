//
//  LoadingTestView.swift
//  Timeen
//
//  Created by Leonardo on 11/03/24.
//

import SwiftUI
import SplineRuntime

struct LoadingTestView: View {
    let scenes: [String] = [
//        "playGround",
//        "book",
//        "streetComponents",
//        "kitchen",
        "moto"
//        "room",
//        "hotel",
        
    ]
    var body: some View {
        ZStack {
//            if let url = Bundle.main.url(forResource: scenes.randomElement(), withExtension: "splineswift") {
//                try? SplineView(sceneFileURL: url)
//                    .ignoresSafeArea(.all)
//            }
            VStack(alignment: .center) {
                Text("Estamos preparando tu prueba")
                    .bold()
                    .font(.custom("Arial Rounded MT Bold", size: 40))
                Spacer()
                LoadingView()
                    .scaleEffect(0.3)
            }
        }
    }
}

#Preview {
    LoadingTestView()
}
