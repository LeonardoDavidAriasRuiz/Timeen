//
//  AccountViewModel.swift
//  Timeen
//
//  Created by Leonardo on 13/02/24.
//

import Foundation

class AccountViewModel: ObservableObject {
    func update(_ account: Account) async -> Result<Account, Error> {
        print(account.password)
        let result = await CloudKitServer().save(record: account.record)
        switch result {
            case .success(let record): return .success(Account(record: record))
            case .failure(let error): return .failure(error)
        }
    }
    
    func deleteAccount(_ account: Account) /*async -> Result<Account, Error>*/ {
        
    }
}
