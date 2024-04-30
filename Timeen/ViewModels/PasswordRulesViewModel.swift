//
//  PasswordRulesViewModel.swift
//  Timeen
//
//  Created by Leonardo on 14/02/24.
//

import Foundation

class PasswordRulesViewModel: ObservableObject {
    @Published var isValidLength: Bool = false
    @Published var containsUppercaseLetter: Bool = false
    @Published var containsLowercaseLetter: Bool = false
    @Published var containsNumber: Bool = false
}
