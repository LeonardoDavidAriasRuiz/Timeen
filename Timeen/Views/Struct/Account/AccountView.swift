//
//  AccountView.swift
//  Timeen
//
//  Created by Leonardo on 13/02/24.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    @EnvironmentObject private var isLoadingVM: IsLoadingViewModel
    @EnvironmentObject private var bodyVM: BodyViewModel
    
    @AppStorage("email") var email: String = ""
    @AppStorage("password") var password: String = ""
    
    @State private var updatedAccountAlert: Bool = false
    @State private var errorUpdatingAccountAlert: Bool = false
    @State private var accountEditable = Account()
    @State private var newPassword: String = ""
    
    private let accountVM = AccountViewModel()
    
    var body: some View {
        VStack {
            NavigationStack {
                 List {
                    Section("Nombre") {
                        TextField("Nombre", text: $accountEditable.name)
                    }
                     
                     Section("Email") {
                         TextField("Email", text: $accountEditable.email)
                             .textInputAutocapitalization(.never)
                             .autocorrectionDisabled()
                     }
                     
                     Section {
                         PasswordChangeView()
                     }
                     
                     Section {
                         Picker("Nivel", selection: $accountEditable.englishLevel) {
                             ForEach(EnglishLevel.allCases, id: \.self) { level in
                                 Text(level.name).tag(level)
                             }
                         }
                         .pickerStyle(.menu)
                     }
                     Section {
                         NavigationLink("About", destination: AboutView())
                     }
                     Section {
                         Button("Cerrar sesión", role: .destructive, action: logout)
                     }
                     
                     Section {
                         Button("Eliminar cuenta", action: deleteAccount)
                             .foregroundStyle(.white)
                             .listRowBackground(Color.red)
                     }
                 }
                 .alert("Se guardaron los cambios.", isPresented: $updatedAccountAlert, actions: {})
                 .alert("No se guardaron los cambios, sucedió.", isPresented: $errorUpdatingAccountAlert, actions: {})
                 .toolbar {
                     if accountEditable != authenticationVM.account {
                         ToolbarItem(placement: .topBarTrailing) {
                             Button("Guardar", action: updateInfo)
                         }
                     }
                 }
                 .navigationTitle("Cuenta")
                 .onAppear(perform: loadInfo)
            }
            BottomMenu()
        }.background(Color(.background))
    }
    
    private func loadInfo() { accountEditable = authenticationVM.account }
    
    private func updateInfo() {
        isLoadingVM.isLoading = true
        Task {
            let result = await accountVM.update(accountEditable)
            isLoadingVM.isLoading = false
            switch result {
                case .success(let account):
                    authenticationVM.account = account
                    updatedAccountAlert = true
                case .failure(let error):
                    errorUpdatingAccountAlert = true
                    print(error)
            }
        }
    }
    
    private func logout() {
        email = ""
        password = ""
        authenticationVM.account = Account()
        authenticationVM.process = .login
    }
    
    private func deleteAccount() {
        
    }
}

enum PasswordChangeProcess {
    case none
    case writtingVerificationCode
    case writtingNewPassword
}
