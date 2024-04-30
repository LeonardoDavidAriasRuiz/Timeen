//
//  PasswordRecoveryView.swift
//  Timeen
//
//  Created by Leonardo on 06/03/24.
//

import SwiftUI

struct PasswordRecoveryView: View {
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    @EnvironmentObject private var isLoadingVM: IsLoadingViewModel
    @State private var email: String = ""
    @State private var noAccountForPasswordRecovery: Bool = false
    @State private var emailSentAlertConfirmationShowing: Bool = false
    
    var body: some View {
        VStack {
            Text("Recuperación").font(.largeTitle).bold()
            
            Spacer()
            
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.background)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .alert("No se encontró ninguna cuenta con ese correo.", isPresented: $noAccountForPasswordRecovery, actions: {})
            Spacer()
            
            Button(action: sendEmailToRecoverPassword) {
                Text("Recuperar")
                    .foregroundStyle(.white)
                    .padding(.vertical, 15)
                    .frame(maxWidth: 200)
                    .background(Color(.blue))
                    .opacity(isReadyToSend() ? 1 : 0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            }
            Button("Recordé mi contraseña", action: rememberPasswordButtonAction)
                .tint(.clear)
                .toggleStyle(.button)
                .foregroundStyle(Color(.blue))
                .padding(.top, 10)
            Spacer()
        }
        .padding(50)
        .frame(width: 380, height: 500)
        .background(.white.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: .black.opacity(0.4), radius: 15, x: 4, y: 4)
        .alert("Se ha enviado la contraseña a tu correo.", isPresented: $emailSentAlertConfirmationShowing, actions: {})
    }
    
    private func isReadyToSend() -> Bool {
        return email.isNotEmpty
    }
    
    private func sendEmailToRecoverPassword() {
        isLoadingVM.isLoading = true
        Task {
            let result = await authenticationVM.fetchAccountForPasswordRecovery(email: email)
            switch result {
                case .success(let account):
                    await MailCore2Server().send(emailType: .recoveryPassword(account: account))
                    emailSentAlertConfirmationShowing = true
                    isLoadingVM.isLoading = false
                    withAnimation {
                        authenticationVM.process = .login
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    noAccountForPasswordRecovery = true
                    isLoadingVM.isLoading = false
            }
        }
    }
    
    private func rememberPasswordButtonAction() {
        withAnimation {
            authenticationVM.process = .login
        }
    }
}

#Preview {
    @State var color1: Color = Color.green
    @State var color2: Color = Color.blue
    @State var color3: Color = Color.red
    return VStack {
        PasswordRecoveryView()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(AuthenticationAnimatedBackground())
}
