//
//  EmailType.swift
//  Timeen
//
//  Created by Leonardo on 04/03/24.
//

import Foundation

enum EmailType {
    case recoveryPassword(account: Account)
    case verifyEmail(account: Account, code: String)
    
    var subject: String {
        switch self {
            case .recoveryPassword: return "Recuperación de contraseña"
            case .verifyEmail: return "Código de verificación"
        }
    }
    
    func body() throws -> String {
        let stringFromHTML = try HTMLServer().fromHTMLToString(self.htmlName)
        return stringFromHTML.replacingOccurrences(of: "&", with: self.htmlReplacement)
    }
    
    var htmlName: String {
        switch self {
            case .recoveryPassword: return "passwordRecovery"
            case .verifyEmail: return "emailVerification"
        }
    }
    
    var accountName: String {
        switch self {
            case .recoveryPassword(let account): return account.name
            case .verifyEmail(let account, _): return account.name
        }
    }
    
    var accountEmail: String {
        switch self {
            case .recoveryPassword(let account): return account.email
            case .verifyEmail(let account, _): return account.email
        }
    }
    
    private var htmlReplacement: String {
        switch self {
            case .recoveryPassword(let account): return account.password
            case .verifyEmail(_, let code): return code
        }
    }
}
