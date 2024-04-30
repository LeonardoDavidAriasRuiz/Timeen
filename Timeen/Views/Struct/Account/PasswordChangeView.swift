//
//  PasswordChangeView.swift
//  Timeen
//
//  Created by Leonardo on 18/03/24.
//

import SwiftUI

struct PasswordChangeView: View {
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    @EnvironmentObject private var isLoadingVM: IsLoadingViewModel
    
    @State var passwordChangeProcess: PasswordChangeProcess = .none
    @State private var newPassword: String = ""
    @State var verificationCodeSent: Int = Int.random(in: 100000...999999)
    @State var verificationCodeSentAlert: Bool = false
    @State var verificationCodeToCheck: String = ""
    @State var verificationCodeWrong: Bool = false
    @State var sendingEmailError: Bool = false
    @State var isNewPasswordValid: Bool = false
    @State var errorUpdatingPassword: Bool = false
    @State var passwordUpdatedAlert: Bool = false
    @State var accountVM: AccountViewModel = AccountViewModel()
    
    var body: some View {
        VStack {
            if passwordChangeProcess == .none {
                Button("Restablecer contraseña", action: startPasswordChangeProcess)
            } else if passwordChangeProcess == .writtingVerificationCode {
                VStack {
                    Button("Cancelar", role: .cancel, action: cancelPasswordChangeProcess)
                    TextField("Código", text: $verificationCodeToCheck)
                }
            } else if passwordChangeProcess == .writtingNewPassword {
                VStack {
                    Button("Cancelar", role: .cancel, action: cancelPasswordChangeProcess)
                    TextField("Nueva contraseña", text: $newPassword)
                    PasswordRulesView(password: $newPassword, isPasswordValid: $isNewPasswordValid)
                    Text("Guardar")
                        .onTapGesture {
                                saveNewPassword()
                            }
                        .foregroundStyle(.blue)
                        .opacity(isNewPasswordValid ? 1 : 0.5)
                        .disabled(!isNewPasswordValid)
                }
            }
        }
        .onChange(of: verificationCodeToCheck, verifyVerificationCode)
        .alert("No se pudo cambiar la contraseña en este momento, intente despues.", isPresented: $sendingEmailError, actions: {})
        .alert("Se te envió un correo con el código de verificación.", isPresented: $verificationCodeSentAlert, actions: {})
        .alert("El código ingresado no fue el correcto.", isPresented: $verificationCodeWrong, actions: {})
        .alert("Se actualizó la contraseña correctamente.", isPresented: $passwordUpdatedAlert, actions: {})
    }
    
    private func startPasswordChangeProcess() {
        Task {
            isLoadingVM.isLoading = true
            verificationCodeSent = Int.random(in: 100000...999999)
            let result = await MailCore2Server().send(
                emailType: .verifyEmail(
                    account: authenticationVM.account,
                    code: String(verificationCodeSent)
                )
            )
            isLoadingVM.isLoading = false
            
            withAnimation {
                switch result {
                    case .success:
                        verificationCodeSentAlert = true
                        passwordChangeProcess = .writtingVerificationCode
                    case .failure(let error):
                        cancelPasswordChangeProcess()
                        sendingEmailError = true
                        print(error)
                }
            }
        }
    }
    
    private func verifyVerificationCode() {
        withAnimation {
            if verificationCodeToCheck.count >= 6 {
                if verificationCodeToCheck == String(verificationCodeSent) {
                    passwordChangeProcess = .writtingNewPassword
                } else {
                    verificationCodeWrong = true
                    verificationCodeToCheck = ""
                }
            }
        }
    }
    
    private func saveNewPassword() {
        print("Contrasena \(newPassword)")
                isLoadingVM.isLoading = true
                Task {
                    authenticationVM.account.password = newPassword
                    print(newPassword)
                    print(authenticationVM.account.password)
                    let result = await accountVM.update(authenticationVM.account)
                    isLoadingVM.isLoading = false
                    switch result {
                        case .success(let account):
                            authenticationVM.account = account
                            cancelPasswordChangeProcess()
                            passwordUpdatedAlert = true
                        case .failure(let error):
                            errorUpdatingPassword = true
                            print(error)
        
                    }
                }
    }
    
    private func cancelPasswordChangeProcess() {
        newPassword = ""
        passwordChangeProcess = .none
        verificationCodeToCheck = ""
    }
}

#Preview {
    PasswordChangeView()
}
