//
//  WordView.swift
//  Timeen
//
//  Created by Leonardo on 24/01/24.
//

import SwiftUI
import AVFoundation

struct WordView: View {
    @EnvironmentObject private var testProcessVM: TestProcessViewModel
    @State private var optionSelected: Bool = false
    @Binding var questionLeft: [Question]
    
    let synthesizer = AVSpeechSynthesizer()
    let columns = [GridItem(), GridItem()]
    let question: Question
    
    init(questionLeft: Binding<[Question]>, question: Question) {
        self._questionLeft = questionLeft
        var question = question
        self.question = question
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text(question.sentence)
                .font(.system(size: 50))
                .foregroundStyle(.white)
                .shadow(color: .black, radius: 15)
            Button("Escuchar") {
                let utterance = AVSpeechUtterance(string: question.sentence)
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                synthesizer.speak(utterance)
            }
            .foregroundStyle(.white)
            .bold()
            .shadow(color: .black, radius: 15)
            Spacer()
            LazyVGrid(columns: columns) {
                ForEach(question.options, id: \.self) { option in
                    Button(action: {checkOption(isRight: option.isRight)}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black.opacity(0.0001), lineWidth: 5)
                                .shadow(color: .black.opacity(0.8), radius: 20)
                            RoundedRectangle(cornerRadius: 20)
                                .tint(optionColor(isRight: option.isRight))
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(optionColor(isRight: option.isRight))
                                .blur(radius: optionSelected ? 0 : 5)
                                .clipShape(.rect(cornerRadius: 20))
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.8), lineWidth: 0.3)
                            Text("\(option.sentence)")
                                .font(.title2)
                                .foregroundStyle(.white)
                        }
                    }
                    
                }
            }
        }
        .padding(.horizontal, 10)
        .disabled(optionSelected)
        .navigationBarBackButtonHidden()
    }
    
    private func checkOption(isRight: Bool) {
        withAnimation {
            optionSelected = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    optionSelected = false
                    let wrong = questionLeft.removeFirst()
                    if !isRight {
                        questionLeft.append(wrong)
                        testProcessVM.answersWrong += 1
                    } else {
                        testProcessVM.answersDone += 1
                    }
                }
            }
        }
    }
    
    private func optionColor(isRight: Bool) -> Color {
        if optionSelected {
            if isRight {
                .green
            } else {
                .red
            }
        } else {
            Color.white.opacity(0.2)
        }
    }
}

#Preview {
    NavigationStack {
        ScrollViewReader { proxy in
            WordView(
                questionLeft: .constant([Question(number: 1, sentense: "", options: [], answerRight: false)]),
                question: Question(
                    number: 1,
                    sentense: "Open",
                    options: [
                        Option(sentense: "Close", isRight: true),
                        Option(sentense: "Above", isRight: false),
                        Option(sentense: "Under", isRight: false),
                        Option(sentense: "Back", isRight: false)
                    ], answerRight: true
                )
            )
//            .background(.yellow)
            .background(ColoredBackground(colors: [.black, .blue], hidedColors: [Color(.blueGreen), Color(.green), Color(.yellow).darker(), Color(.orange), Color(.red), Color(.purple)]))
        }
    }
}

extension Dictionary: RandomAccessCollection {
    public func index(before i: Index) -> Index {
        return self.index(i, offsetBy: -1)
    }
}
