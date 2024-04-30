//
//  Test.swift
//  Timeen
//
//  Created by Leonardo on 24/01/24.
//

import Foundation
import CloudKit

struct Test: Identifiable, Hashable, Codable {
    static let typeKey = "Tests"
    static let numberKey = "number"
    static let testTypeKey = "testType"
    static let questionsKey = "questions"
    static let timeUsedKey = "timeUsed"
    static let answersDoneKey = "answersDone"
    static let answersWrongKey = "answersWrong"
    static let accountIdKey = "accountId"
    
    let number: Int
    let testType: TestType
    var questions: [Question]
    var timeUsed: Int = 0
    var answersDone: Int = 0
    var answersWrong: Int = 0
    var accountId: String = ""
    var totalTime: Double {
        Double(questions.count * 3)
    }
    
    var id: CKRecord.ID {
        record.recordID
    }
    
    private var _record: CKRecord
    
    var record: CKRecord {
        _record[Test.numberKey] = number
        _record[Test.testTypeKey] = testType.toRecordValue
        _record[Test.timeUsedKey] = timeUsed
        _record[Test.answersDoneKey] = answersDone
        _record[Test.answersWrongKey] = answersWrong
        _record[Test.accountIdKey] = accountId
        if let questionsData = try? JSONEncoder().encode(questions) {
            _record[Test.questionsKey] = questionsData
        }
        return _record
    }
    
    private enum CodingKeys: String, CodingKey {
        case number
        case testType
        case questions
    }
    
    init(number: Int, testType: TestType, questions: [Question]) {
        self._record = CKRecord(recordType: Test.typeKey)
        self.number = number
        self.testType = testType
        self.questions = questions
    }
    
    init(record: CKRecord) throws {
        guard let number = record[Test.numberKey] as? Int,
              let testTypeValue = record[Test.testTypeKey] as? Int,
              let timeUsed = record[Test.timeUsedKey] as? Int,
              let answersDone = record[Test.answersDoneKey] as? Int,
              let answersWrong = record[Test.answersWrongKey] as? Int,
              let questionsData = record[Test.questionsKey] as? Data,
              let accountId = record[Test.accountIdKey] as? String,
              let questions = try? JSONDecoder().decode([Question].self, from: questionsData) else {
            throw NSError(domain: "AppDomain", code: 100, userInfo: [NSLocalizedDescriptionKey : "Failed to decode properties from CKRecord"])
        }
        
        self.number = number
        self.testType = TestType.fromRecordValue(testTypeValue)
        self.timeUsed = timeUsed
        self.answersDone = answersDone
        self.answersWrong = answersWrong
        self.questions = questions
        self.accountId = accountId
        self._record = record
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decode(Int.self, forKey: .number)
        self.testType = try container.decode(TestType.self, forKey: .testType)
        self.questions = try container.decode([Question].self, forKey: .questions)
        self._record = CKRecord(recordType: Test.typeKey)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(number, forKey: .number)
        try container.encode(testType, forKey: .testType)
        try container.encode(questions, forKey: .questions)
    }
}

extension Test {
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
    
    static func == (lhs: Test, rhs: Test) -> Bool {
        lhs.number == rhs.number &&
        lhs.testType == rhs.testType &&
        lhs.questions == rhs.questions
    }
    
    static var example: Test {
        Test(
            number: 1, testType: .antonym,
            questions: [
                Question(
                    number: 1,
                    sentense: "Open",
                    options: [
                        Option(sentense: "Close", isRight: true),
                        Option(sentense: "Above", isRight: false),
                        Option(sentense: "Under", isRight: false),
                        Option(sentense: "Back", isRight: false)
                    ], answerRight: true
                ),
                Question(
                    number: 2,
                    sentense: "Good",
                    options: [
                        Option(sentense: "Bad", isRight: true),
                        Option(sentense: "Right", isRight: false),
                        Option(sentense: "Fine", isRight: false),
                        Option(sentense: "Salty", isRight: false)
                    ], answerRight: true
                ),
                Question(
                    number: 3,
                    sentense: "Fast",
                    options: [
                        Option(sentense: "Slow", isRight: true),
                        Option(sentense: "Quick", isRight: false),
                        Option(sentense: "Rapid", isRight: false),
                        Option(sentense: "Speedy", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 4,
                    sentense: "Light",
                    options: [
                        Option(sentense: "Dark", isRight: true),
                        Option(sentense: "Bright", isRight: false),
                        Option(sentense: "Dim", isRight: false),
                        Option(sentense: "Glowing", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 5,
                    sentense: "Hot",
                    options: [
                        Option(sentense: "Cold", isRight: true),
                        Option(sentense: "Warm", isRight: false),
                        Option(sentense: "Boiling", isRight: false),
                        Option(sentense: "Chilly", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 6,
                    sentense: "High",
                    options: [
                        Option(sentense: "Low", isRight: true),
                        Option(sentense: "Tall", isRight: false),
                        Option(sentense: "Short", isRight: false),
                        Option(sentense: "Elevated", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 7,
                    sentense: "Hard",
                    options: [
                        Option(sentense: "Soft", isRight: true),
                        Option(sentense: "Rigid", isRight: false),
                        Option(sentense: "Firm", isRight: false),
                        Option(sentense: "Tough", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 8,
                    sentense: "Young",
                    options: [
                        Option(sentense: "Old", isRight: true),
                        Option(sentense: "New", isRight: false),
                        Option(sentense: "Ancient", isRight: false),
                        Option(sentense: "Modern", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 9,
                    sentense: "Wet",
                    options: [
                        Option(sentense: "Dry", isRight: true),
                        Option(sentense: "Damp", isRight: false),
                        Option(sentense: "Moist", isRight: false),
                        Option(sentense: "Soggy", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 10,
                    sentense: "Big",
                    options: [
                        Option(sentense: "Small", isRight: true),
                        Option(sentense: "Large", isRight: false),
                        Option(sentense: "Huge", isRight: false),
                        Option(sentense: "Tiny", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 11,
                    sentense: "Strong",
                    options: [
                        Option(sentense: "Weak", isRight: true),
                        Option(sentense: "Powerful", isRight: false),
                        Option(sentense: "Sturdy", isRight: false),
                        Option(sentense: "Robust", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 12,
                    sentense: "Fast",
                    options: [
                        Option(sentense: "Slow", isRight: true),
                        Option(sentense: "Quick", isRight: false),
                        Option(sentense: "Rapid", isRight: false),
                        Option(sentense: "Speedy", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 13,
                    sentense: "Quiet",
                    options: [
                        Option(sentense: "Loud", isRight: true),
                        Option(sentense: "Silent", isRight: false),
                        Option(sentense: "Noisy", isRight: false),
                        Option(sentense: "Soft", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 14,
                    sentense: "Happy",
                    options: [
                        Option(sentense: "Sad", isRight: true),
                        Option(sentense: "Joyful", isRight: false),
                        Option(sentense: "Cheerful", isRight: false),
                        Option(sentense: "Gloomy", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 15,
                    sentense: "Ancient",
                    options: [
                        Option(sentense: "Modern", isRight: true),
                        Option(sentense: "Old", isRight: false),
                        Option(sentense: "Historical", isRight: false),
                        Option(sentense: "New", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 16,
                    sentense: "Sharp",
                    options: [
                        Option(sentense: "Blunt", isRight: true),
                        Option(sentense: "Pointed", isRight: false),
                        Option(sentense: "Cutting", isRight: false),
                        Option(sentense: "Dull", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 17,
                    sentense: "Simple",
                    options: [
                        Option(sentense: "Complex", isRight: true),
                        Option(sentense: "Easy", isRight: false),
                        Option(sentense: "Basic", isRight: false),
                        Option(sentense: "Complicated", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 18,
                    sentense: "Thick",
                    options: [
                        Option(sentense: "Thin", isRight: true),
                        Option(sentense: "Wide", isRight: false),
                        Option(sentense: "Broad", isRight: false),
                        Option(sentense: "Narrow", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 19,
                    sentense: "Rough",
                    options: [
                        Option(sentense: "Smooth", isRight: true),
                        Option(sentense: "Coarse", isRight: false),
                        Option(sentense: "Uneven", isRight: false),
                        Option(sentense: "Bumpy", isRight: false)
                    ],
                    answerRight: true
                ),
                Question(
                    number: 20,
                    sentense: "Empty",
                    options: [
                        Option(sentense: "Full", isRight: true),
                        Option(sentense: "Vacant", isRight: false),
                        Option(sentense: "Hollow", isRight: false),
                        Option(sentense: "Sparse", isRight: false)
                    ],
                    answerRight: true
                )
            ]
        )
    }
}
