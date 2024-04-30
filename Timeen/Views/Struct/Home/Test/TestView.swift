//
//  TestView.swift
//  Timeen
//
//  Created by Leonardo on 24/01/24.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject private var testProcessVM: TestProcessViewModel
    private let startTime: Date = .now
    private let endTime: Date? = nil
    
    let test: Test
    @State private var questionLeft: [Question]
    
    init(test: Test) {
        self.test = test
        self._questionLeft = State(initialValue: test.questions)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TestTimer(totalTime: test.totalTime, actionWhenEnd: testDone)
                    .padding(.horizontal, 10)
                    .foregroundStyle(.white)
                    .tint(.white)
                    .shadow(color: .black, radius: 15)
                HStack(spacing: -5) {
                    Spacer()
                    ForEach(questionLeft, id: \.self) { question in
                        Image(systemName: "\(question.number).circle.fill")
                            .foregroundStyle(.white.opacity(0.8))
                            .padding(0)
                        Spacer(minLength: 0)
                    }
                }
                .padding(.horizontal, 10)
                .shadow(color: .black, radius: 15)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(questionLeft, id: \.self) { question in
                            WordView(questionLeft: $questionLeft, question: question)
                                .containerRelativeFrame(.horizontal)
                        }
                        .scrollTargetLayout()
                    }
                }
                .scrollDisabled(true)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
                .contentMargins(10, for: .scrollContent)
            }
            .onChange(of: questionLeft, checkQuestionsCount)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(ColoredBackground(colors: [.black, .blue], hidedColors: [Color(.blueGreen), Color(.green), Color(.yellow).darker(), Color(.orange), Color(.red), Color(.purple)]))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text(test.testType.title)
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 15)
                }
            }
        }
    }
    
    private func testEndedByTime() {
        testProcessVM.testResult = .failed
        testDone()
    }
    
    private func checkQuestionsCount() {
        if questionLeft.isEmpty {
            testProcessVM.testResult = .failed
            testDone()
        }
    }
    
    private func testDone() {
        testProcessVM.testProcess = .done
    }
}

#Preview {
    TestView(test: Test.example)
        .environmentObject(TestProcessViewModel())
}
