//
//  SignUpView.swift
//  Timeen
//
//  Created by Leonardo on 24/01/24.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    @EnvironmentObject private var isLoadingVM: IsLoadingViewModel
    @StateObject private var passwordRulesVM = PasswordRulesViewModel()
    @State private var account: Account = Account()
    @State private var seePasswordCharacters: Bool = false
    @State private var errorSingingup: Bool = false
    @State private var userRegisteredErrorLabelShowing: Bool = false
    
    var body: some View {
            VStack {
                Text("Registrate").font(.largeTitle).bold()
                TextField("Nombre", text: $account.name)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.background)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                HStack {
                    Text("Ingles")
                    Spacer()
                    Picker("", selection: $account.englishLevel) {
                        Text(EnglishLevel.unknown.name).tag(EnglishLevel.unknown)
                        ForEach(EnglishLevel.allCases, id: \.self) { level in
                            Text(level.name.capitalized).tag(level)
                        }
                    }
                    .pickerStyle(.menu)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(Color.background)
                .clipShape(RoundedRectangle(cornerRadius: 15))
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
                .onChange(of: account.password, validatePassword)
                
                VStack {
                    HStack {
                        Image(systemName: passwordRulesVM.isValidLength ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundStyle(passwordRulesVM.isValidLength ? .green : .red)
                            .contentTransition(.symbolEffect(.replace))
                        Text("8 - 20 caracteres")
                            .foregroundStyle(.black.opacity(0.7))
                        Spacer()
                    }
                    HStack {
                        Image(systemName: passwordRulesVM.containsUppercaseLetter ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundStyle(passwordRulesVM.containsUppercaseLetter ? .green : .red)
                            .contentTransition(.symbolEffect(.replace))
                        Text("Al menos una mayúscula")
                            .foregroundStyle(.black.opacity(0.7))
                        Spacer()
                    }
                    HStack {
                        Image(systemName: passwordRulesVM.containsLowercaseLetter ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundStyle(passwordRulesVM.containsLowercaseLetter ? .green : .red)
                            .contentTransition(.symbolEffect(.replace))
                        Text("Al menos una mminúscula")
                            .foregroundStyle(.black.opacity(0.7))
                        Spacer()
                    }
                    HStack {
                        Image(systemName: passwordRulesVM.containsNumber ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundStyle(passwordRulesVM.containsNumber ? .green : .red)
                            .contentTransition(.symbolEffect(.replace))
                        Text("Al menos un número")
                            .foregroundStyle(.black.opacity(0.7))
                        Spacer()
                    }
                    if userRegisteredErrorLabelShowing {
                        HStack {
                            Text("Este usuario ya está registrado.")
                                .foregroundStyle(.red)
                            Spacer()
                        }
                    }
                }
                Spacer()
                Button(action: signup) {
                    Text("Registrar")
                        .foregroundStyle(.white)
                        .padding(.vertical, 15)
                        .frame(maxWidth: 200)
                        .background(Color(.blue))
                        .opacity(isReadyToSave() ? 1 : 0.5)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .alert("Error registrando al usuario", isPresented: $errorSingingup, actions: {})
                }
                .disabled(!isReadyToSave())
                Button("Ya tengo una cuenta", action: haveAccountButtonAction)
                    .tint(.clear)
                    .toggleStyle(.button)
                    .foregroundStyle(Color(.blue))
                    .padding(.top, 10)
            }
            .padding(50)
            .frame(width: 380, height: 570)
            .background(.white.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: .black.opacity(0.4), radius: 15, x: 4, y: 4)
    }
}

extension SignUpView {
    private func haveAccountButtonAction() { withAnimation { authenticationVM.process = .login } }
    
    private func validatePassword() {
        withAnimation {
            isValidLength()
            containsUppercaseLetter()
            containsLowercaseLetter()
            containsNumber()
        }
    }
    
    private func isValidLength() { passwordRulesVM.isValidLength = account.password.count >= 8 && account.password.count <= 20 }
    
    private func containsUppercaseLetter() { passwordRulesVM.containsUppercaseLetter = account.password.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil }
    
    private func containsLowercaseLetter() { passwordRulesVM.containsLowercaseLetter = account.password.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil }
    
    private func containsNumber() { passwordRulesVM.containsNumber = account.password.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil }
    
    private func isUserValid() -> Bool { account.email.isNotEmpty }
    
    private func isPasswordValid() -> Bool {
        passwordRulesVM.isValidLength &&
        passwordRulesVM.containsUppercaseLetter &&
        passwordRulesVM.containsLowercaseLetter &&
        passwordRulesVM.containsNumber
    }
    
    private func isReadyToSave() -> Bool {
        account.name.isNotEmpty &&
        isPasswordValid() &&
        isUserValid()
    }
    
    private func signup() {
        isLoadingVM.isLoading = true
        Task {
            let resultIfAlreadyRegistered = await authenticationVM.isEmailAlreadyRegistered(account.email)
            var alreadyRegistered: Bool? = nil
            switch resultIfAlreadyRegistered {
                case .success(let registered): 
                    userRegisteredErrorLabelShowing = registered
                    alreadyRegistered = registered
                case .failure(let error):
                    errorSingingup = true
                    print(error)
            }
            
            guard let alreadyRegistered = alreadyRegistered, !alreadyRegistered else {
                isLoadingVM.isLoading = false
                return
            }
            
            let result = await authenticationVM.registerNewAccount(account)
            isLoadingVM.isLoading = false
            switch result {
                case .success(let account):
                    withAnimation {
                        self.authenticationVM.account = account
                        self.authenticationVM.process = .authenticated
                    }
                case .failure(let error):
                    print(error)
                    errorSingingup = true
            }
        }
    }
}
