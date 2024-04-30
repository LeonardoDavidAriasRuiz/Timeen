//
//  Option.swift
//  Timeen
//
//  Created by Leonardo on 08/03/24.
//

import Foundation

struct Option: Identifiable, Hashable, Equatable, Codable {
    let id = UUID().uuidString
    let sentence: String
    let isRight: Bool
    
    init(sentense: String, isRight: Bool) {
        self.sentence = sentense
        self.isRight = isRight
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sentence = try container.decode(String.self, forKey: .sentence)
        self.isRight = try container.decode(Bool.self, forKey: .isRight)
    }
}

extension Option {
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
    
    static func == (lhs: Option, rhs: Option) -> Bool {
        lhs.sentence == rhs.sentence &&
        lhs.isRight == rhs.isRight
    }
}
