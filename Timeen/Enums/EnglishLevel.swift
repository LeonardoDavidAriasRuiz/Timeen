//
//  EnglishLevel.swift
//  Timeen
//
//  Created by Leonardo on 13/02/24.
//

import Foundation

enum EnglishLevel {
    case unknown
    case basic
    case intermediate
    case advanced
    
    static var allCases: [EnglishLevel] {
        return [.basic, .intermediate, .advanced]
    }
    
    var recordValue: Int {
        switch self {
            case .unknown: return 0
            case .basic: return 1
            case .intermediate: return 2
            case .advanced: return 3
        }
    }
    
    var name: String {
        switch self {
            case .unknown: return "No lo sé"
            case .basic: return "básico"
            case .intermediate: return "intermedio"
            case .advanced: return "avanzado"
        }
    }
    
    static func level(recordValue: Int) -> EnglishLevel {
        switch recordValue {
            case 0: return .unknown
            case 1: return .basic
            case 2: return .intermediate
            case 3: return .advanced
            default: return .basic
        }
    }
}
