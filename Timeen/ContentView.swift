//
//  ContentView.swift
//  Timeen
//
//  Created by Leonardo on 24/01/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authenticationVM = AuthenticationViewModel()
    @StateObject private var isLoadingVM = IsLoadingViewModel()
    @AppStorage("email") var email: String = ""
    @AppStorage("password") var password: String = ""
    
    var body: some View {
        ZStack {
            WelcomeView()
            if isLoadingVM.isLoading {
                LoadingView()
                    .scaleEffect(0.4)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white.opacity(0.5))
            }
        }
        .onAppear(perform: tryToLogin)
        .environmentObject(authenticationVM)
        .environmentObject(isLoadingVM)
        .preferredColorScheme(.light)
    }
    
    private func tryToLogin() {
        if email.isNotEmpty, password.isNotEmpty {
            self.isLoadingVM.isLoading = true
            Task {
                let storedAccount = Account(email: email, password: password)
                let result = await authenticationVM.fetchAccountCredential(account: storedAccount)
                self.isLoadingVM.isLoading = false
                switch result {
                    case .success(let account):
                        withAnimation {
                            if let account = account {
                                self.authenticationVM.account = account
                                self.authenticationVM.process = .authenticated
                            }
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
