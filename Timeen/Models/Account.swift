//
//  Account.swift
//  Timeen
//
//  Created by Leonardo on 25/01/24.
//

import Foundation
import CloudKit
import SwiftData

//@Model 
struct Account: Hashable, Identifiable, Equatable {
    static let typeKey = "Accounts"
    static let nameKey = "name"
    static let emailKey = "email"
    static let passwordKey = "password"
    static let englishLevelKey = "englishLevel"
    static let themesKey = "themes"
    
    var name: String = ""
    var email: String = ""
    var password: String = ""
    var englishLevel: EnglishLevel = .unknown
    var themes: [Theme] = []
    
    var id: CKRecord.ID {
        record.recordID
    }
    
    private var _record: CKRecord
    
    var record: CKRecord {
        _record[Account.nameKey] = name
        _record[Account.emailKey] = email.lowercased()
        _record[Account.passwordKey] = password
        _record[Account.englishLevelKey] = englishLevel.name
        _record[Account.themesKey] = themes.map { $0.toRecordValue }
        return _record
    }
    
    init(record: CKRecord) {
        self.name = record[Account.nameKey] as? String ?? ""
        self.email = record[Account.emailKey] as? String ?? ""
        self.password = record[Account.passwordKey] as? String ?? ""
        self.englishLevel = .level(recordValue: record[Account.englishLevelKey] ?? 1)
        self.themes = (record[Account.themesKey] as? [Int] ?? []).compactMap { Theme.fromRecordValue($0) }
        self._record = record
    }
    
    init(name: String = "", email: String = "", password: String = "", englishLevel: EnglishLevel = .unknown, themes: [Theme] = []) {
        self._record = CKRecord(recordType: Account.typeKey)
        self.name = name
        self.email = email
        self.password = password
        self.englishLevel = englishLevel
        self.themes = themes
    }
    
}

extension Account {
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
    
    static func == (lhs: Account, rhs: Account) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.email == rhs.email &&
        lhs.password == rhs.password &&
        lhs.englishLevel == rhs.englishLevel &&
        lhs.themes == rhs.themes
    }
}
