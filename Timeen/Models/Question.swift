//
//  Question.swift
//  Timeen
//
//  Created by Leonardo on 24/01/24.
//

import Foundation

struct Question: Identifiable, Hashable, Equatable, Codable {
    let id = UUID().uuidString
    let number: Int
    let sentence: String
    var options: [Option]
    var answerRight: Bool
    
    init(number: Int, sentense: String, options: [Option], answerRight: Bool) {
        self.number = number
        self.sentence = sentense
        self.options = options
        self.answerRight = answerRight
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decode(Int.self, forKey: .number)
        self.sentence = try container.decode(String.self, forKey: .sentence)
        self.options = try container.decode([Option].self, forKey: .options)
        self.answerRight = false
    }
}

extension Question {
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
    
    static func == (lhs: Question, rhs: Question) -> Bool {
        lhs.number == rhs.number &&
        lhs.sentence == rhs.sentence &&
        lhs.options == rhs.options &&
        lhs.answerRight == rhs.answerRight
    }
}
