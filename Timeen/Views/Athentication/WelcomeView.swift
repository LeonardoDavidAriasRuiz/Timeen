//
//  WelcomeView.swift
//  Timeen
//
//  Created by Leonardo on 25/01/24.
//

import SwiftUI

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    @EnvironmentObject private var isLoading: IsLoadingViewModel
    @State private var account: Account? = nil
    @State var color1: Color = Color(.blue)
    @State var color2: Color = Color(.blueGreen)
    @State var color3: Color = Color(.green)
    
    var body: some View {
        ZStack {
            if authenticationVM.process == .authenticated {
                StartingView()
            } else {
                HStack {
                    VStack {
                        LoginView()
                            .frame(width: authenticationVM.process == .login ? 5000 : 0)
                            .frame(height: authenticationVM.process == .login ? 5000 : 0)
                        PasswordRecoveryView().frame(width: authenticationVM.process == .login ? 5000 : 0)
                            .frame(width: authenticationVM.process == .passwordRecovery ? 5000 : 0)
                            .frame(height: authenticationVM.process == .passwordRecovery ? 5000 : 0)
                    }
                    SignUpView()
                        .frame(width: authenticationVM.process == .signup ? 5000 : 0)
                        .frame(height: 5000)
                }
                .background(AuthenticationAnimatedBackground())
                
            }
        }
    }
}

#Preview {
    ContentView()
}
