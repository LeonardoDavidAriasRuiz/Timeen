//
//  LoginView.swift
//  Timeen
//
//  Created by Leonardo on 24/01/24.
//

import SwiftUI
import AVFoundation

struct LoginView: View {
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    @EnvironmentObject private var isLoadingVM: IsLoadingViewModel
    @State private var account: Account = Account()
    @State private var seePasswordCharacters: Bool = false
    @State private var informationIncorrect: Bool = false
    @State private var authenticationError: Bool = false
    @AppStorage("email") var email: String = ""
    @AppStorage("password") var password: String = ""
    
    var body: some View {
        VStack {
            Text("Inicia sesión").font(.largeTitle).bold()
            TextField("Email", text: $account.email)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.background)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            HStack {
                if seePasswordCharacters {
                    TextField("Contraseña", text: $account.password)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                } else {
                    SecureField("Contraseña", text: $account.password)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                
                Button(action: {seePasswordCharacters.toggle()}){
                    Image(systemName: seePasswordCharacters ? "eye.slash.fill" : "eye.fill")
                        .foregroundStyle(.blue)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.background)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .alert("Hubo un error al intentar iniciar sesión, intenta de nuevo o más tarde.", isPresented: $authenticationError, actions: {})
            if informationIncorrect {
                HStack {
                    Text("Correo o contraseña incorrecta")
                        .foregroundStyle(.red)
                    Spacer()
                }
            }
            Spacer()
            Button(action: continueButtonAction) {
                Text("Continuar")
                    .foregroundStyle(.white)
                    .padding(.vertical, 15)
                    .frame(maxWidth: 200)
                    .background(Color(.blue))
                    .opacity(isReadyToContinue() ? 1 : 0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            }
            .disabled(!isReadyToContinue())
            Button("Olvidé mi contraseña", action: goPasswordRecoveryView)
                .tint(.clear)
                .toggleStyle(.button)
                .foregroundStyle(Color(.blue))
                .padding(.top, 10)
            Button("No tengo una cuenta", action: noAccountButtonAction)
                .tint(.clear)
                .toggleStyle(.button)
                .foregroundStyle(Color(.blue))
                .padding(.top, 10)
        }
        .padding(50)
        .frame(width: 380, height: 500)
        .background(.white.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: .black.opacity(0.4), radius: 15, x: 4, y: 4)
    }
}

extension LoginView {
    
    private func goPasswordRecoveryView() {
        withAnimation {
            authenticationVM.process = .passwordRecovery
            authenticationVM.color1 = .blue
            authenticationVM.color2 = .pink
            authenticationVM.color3 = .purple
        }
    }
    
    private func noAccountButtonAction() {
        withAnimation {
            authenticationVM.process = .signup
        }
    }
    
    private func continueButtonAction() {
        isLoadingVM.isLoading = true
        Task {
            let result = await authenticationVM.fetchAccountCredential(account: account)
            isLoadingVM.isLoading = false
            switch result {
                case .success(let account):
                    withAnimation {
                        if let account = account {
                            authenticationVM.account = account
                            authenticationVM.process = .authenticated
                            email = account.email
                            password = account.password
                        } else {
                            informationIncorrect = true
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    authenticationError = true
            }
        }
    }
    
    private func isReadyToContinue() -> Bool { account.email.isNotEmpty && account.password.isNotEmpty }
}

#Preview {
    ContentView()
}
