//
//  TestProcessViewModel.swift
//  Timeen
//
//  Created by Leonardo on 31/03/24.
//

import Foundation

class TestProcessViewModel: ObservableObject {
    @Published var testProcess: TestProcess = .loading
    @Published var test: Test? = nil
    @Published var errorLoadingTest: Bool = false
    @Published var testResult: TestResult = .passed
    @Published var timeUsed: Int = 0
    @Published var answersDone: Int = 0
    @Published var answersWrong: Int = 0
    
    var totalQuestions: Int {
        test?.questions.count ?? 0
    }
}
