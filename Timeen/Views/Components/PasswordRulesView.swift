//
//  PasswordRulesView.swift
//  Timeen
//
//  Created by Leonardo on 14/03/24.
//

import SwiftUI

struct PasswordRulesView: View {
    @StateObject private var passwordRulesVM = PasswordRulesViewModel()
    @Binding var password: String
    @Binding var isPasswordValid: Bool
    
    var body: some View {
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
        }
        .onChange(of: password, validatePassword)
    }
    
    private func isValidLength() { passwordRulesVM.isValidLength = password.count >= 8 && password.count <= 20 }
    
    private func containsUppercaseLetter() { passwordRulesVM.containsUppercaseLetter = password.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil }
    
    private func containsLowercaseLetter() { passwordRulesVM.containsLowercaseLetter = password.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil }
    
    private func containsNumber() { passwordRulesVM.containsNumber = password.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil }
    
    private func validatePassword() {
        withAnimation {
            isValidLength()
            containsUppercaseLetter()
            containsLowercaseLetter()
            containsNumber()
            
            isPasswordValid = passwordRulesVM.isValidLength &&
            passwordRulesVM.containsUppercaseLetter &&
            passwordRulesVM.containsLowercaseLetter &&
            passwordRulesVM.containsNumber
        }
    }
}
