//
//  AuthenticationViewModel.swift
//  Timeen
//
//  Created by Leonardo on 27/01/24.
//

import SwiftUI
import CloudKit
import Combine

class AuthenticationViewModel: ObservableObject {
    private let cloudKitServer = CloudKitServer()
    @Published var process: AuthenticationProcesType = .login
    @Published var account: Account = Account()
    @Published var color1: Color = Color(.blue)
    @Published var color2: Color = Color(.blueGreen)
    @Published var color3: Color = Color(.green)
}

extension AuthenticationViewModel {
    
    func fetchAccountCredential(account credentials: Account) async -> Result<Account?, Error> {
        let usernamePredicate = NSPredicate(format: "\(Account.emailKey) == %@", credentials.email.lowercased())
        let passwordPredicate = NSPredicate(format: "\(Account.passwordKey) == %@", credentials.password)
        let compoundPredicate = NSCompoundPredicate(type: .and, subpredicates: [usernamePredicate,passwordPredicate])
        
        let result = await cloudKitServer.fetch(recordType: Account.typeKey, predicates: compoundPredicate)
        switch result {
            case .success(let records):
                let firstAccount = records.compactMap { Account(record: $0) }.first
                return .success(firstAccount)
            case .failure(let error):
                return .failure(error)
        }
    }
    
    func fetchAccountForPasswordRecovery(email: String) async -> Result<Account, Error> {
        let usernamePredicate = NSPredicate(format: "\(Account.emailKey) == %@", email.lowercased())
        let compoundPredicate = NSCompoundPredicate(type: .and, subpredicates: [usernamePredicate])
        
        let result = await cloudKitServer.fetch(recordType: Account.typeKey, predicates: compoundPredicate)
        switch result {
            case .success(let records):
                if let firstRecord = records.first {
                    return .success(Account(record: firstRecord))
                } else {
                    return .failure(AuthError())
                }
                
            case .failure(let error):
                return .failure(error)
        }
    }
    
    func isEmailAlreadyRegistered(_ email: String) async -> Result<Bool, Error> {
        let usernamePredicate = NSPredicate(format: "\(Account.emailKey) == %@", email.lowercased())
        let compoundPredicate = NSCompoundPredicate(type: .and, subpredicates: [usernamePredicate])
        
        let result = await cloudKitServer.fetch(recordType: Account.typeKey, predicates: compoundPredicate)
        switch result {
            case .success(let records):
                return .success(records.isNotEmpty)
            case .failure(let error):
                return .failure(error)
        }
    }
    
    func registerNewAccount(_ account: Account) async -> Result<Account, Error> {
        let result = await cloudKitServer.save(record: account.record)
        switch result {
            case .success(let record):
                return .success(Account(record: record))
            case .failure(let error):
                return .failure(error)
        }
    }
}

struct AuthError: Error {
    var description: String {
        "Error trying to login"
    }
}
