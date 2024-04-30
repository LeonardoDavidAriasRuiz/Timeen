//
//  AuthenticationAnimatedBackground.swift
//  Timeen
//
//  Created by Leonardo on 25/01/24.
//

import SwiftUI

struct AuthenticationAnimatedBackground: View {
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    @State var colors: [Color] = []
    @State var hidedColor: Color = .white
    
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
        .onAppear {
            colors = [
                authenticationVM.color1,
                authenticationVM.color2,
                authenticationVM.color3,
                authenticationVM.color3
            ]
        }
        .onChange(of: authenticationVM.color1) {
            withAnimation {
                colors = [
                    authenticationVM.color1,
                    authenticationVM.color2,
                    authenticationVM.color3,
                    authenticationVM.color3
                ]
            }
        }
        .onChange(of: authenticationVM.process) { oldValue, newValue in
            switch authenticationVM.process {
                case .login:
                    authenticationVM.color1 = Color(.blue)
                    authenticationVM.color2 = Color(.blueGreen)
                    authenticationVM.color3 = Color(.green)
                case .signup:
                    authenticationVM.color1 = Color(.yellow)
                    authenticationVM.color2 = Color(.orange)
                    authenticationVM.color3 = Color(.red)
                case .authenticated:
                    authenticationVM.color1 =  Color(.background)
                    authenticationVM.color2 =  Color(.green)
                    authenticationVM.color3 =  Color(.green)
                case .passwordRecovery:
                    authenticationVM.color1 = Color(.purple)
                    authenticationVM.color2 = Color.pink
                    authenticationVM.color3 = Color.blue
            }
        }
        .ignoresSafeArea()
        .onReceive(timer) { _ in
            withAnimation(.smooth(duration: 5)) {
                hidedColor = colors.removeFirst()
                colors.append(hidedColor)
            }
            withAnimation(.smooth(duration: 10)) {
                startPoints.append(startPoints.removeFirst())
                endPoints.append(endPoints.removeFirst())
            }
        }
    }
}

struct AnimatedBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationAnimatedBackground()
            .environmentObject(AuthenticationViewModel())
    }
}

