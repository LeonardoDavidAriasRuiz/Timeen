//
//  TestFinishedView.swift
//  Timeen
//
//  Created by Leonardo on 08/03/24.
//

import SwiftUI

struct TestFinishedView: View {
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    @EnvironmentObject private var testProcessVM: TestProcessViewModel
    @EnvironmentObject private var isLoadingVM: IsLoadingViewModel
    @EnvironmentObject private var homeVM: HomeViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var screenSize: CGFloat = UIScreen.main.bounds.size.width
    @State private var endMessage: CGFloat = 0
    @State private var endMessageAnimationDone: Bool = false
    
    var body: some View {
        VStack {
            Text("Tiempo")
                .font(.custom("Arial Rounded MT Bold", size: endMessage))
                .bold()
                .foregroundStyle(.white)
            
            if endMessageAnimationDone {
                
                Spacer()
                
                LottieIcon(name: "SadFace", speed: 0.8, size: 100)
                
                Spacer()
                
                VStack(spacing: 20) {
                    StatisticCard("Tiempo", systemImage: "deskclock.fill") {
                        Text("\(testProcessVM.timeUsed) s").font(.largeTitle)
                    }
                    
                    StatisticCard("Preguntas", systemImage: "list.bullet.clipboard.fill") {
                        Text(testProcessVM.totalQuestions.description)
                    }
                    
                    StatisticCard("Correctas", systemImage: "flag.checkered") {
                        Text(testProcessVM.answersDone.description)
                    }
                    
                    StatisticCard("Incorrectas", systemImage: "xmark.diamond.fill") {
                        Text(testProcessVM.answersWrong.description)
                    }
                }
                .foregroundStyle(.white)
                
                Spacer()
                Spacer()
                
                HStack {
                    
                    Button(action: repeatTest) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.black.opacity(0.0001), lineWidth: 5)
                                .shadow(color: .black.opacity(0.2), radius: 10)
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(.white.opacity(0.4))
                                .frame(maxWidth: .infinity)
                                .blur(radius: 5)
                                .clipShape(.rect(cornerRadius: 30))
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white.opacity(0.8), lineWidth: 0.3)
                            HStack {
                                Image(systemName: "arrow.circlepath")
                                    .bold()
                                Text("Repetir")
                                    .font(.title)
                            }
                            .padding(.horizontal, 15)
                        }
                        .frame(height: 80)
                    }
                    
                    Button(action: saveTest) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.black.opacity(0.0001), lineWidth: 5)
                                .shadow(color: .black.opacity(0.2), radius: 10)
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(.white.opacity(0.4))
                                .frame(maxWidth: .infinity)
                                .blur(radius: 5)
                                .clipShape(.rect(cornerRadius: 30))
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white.opacity(0.8), lineWidth: 0.3)
                            HStack {
                                Image(systemName: "door.left.hand.open")
                                    .bold()
                                Text("Salir")
                                    .font(.title)
                            }
                            .padding(.horizontal, 15)
                        }
                        .frame(height: 80)
                    }
                }
            }
        }
        .font(.custom("Arial Rounded MT Bold", size: 20))
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ColoredBackground(colors: [.gray.opacity(0.5),.blue], hidedColors: [Color(.blueGreen), Color(.green), Color(.orange)]))
        .onAppear(perform: endMessageAnimation)
    }
    
    private func repeatTest() {
        testProcessVM.testProcess = .practicing
        testProcessVM.timeUsed = 0
        testProcessVM.answersWrong = 0
        testProcessVM.answersDone = 0
    }
    
    private func saveTest() {
        isLoadingVM.isLoading = true
        testProcessVM.test?.answersDone = testProcessVM.answersDone
        testProcessVM.test?.answersWrong = testProcessVM.answersWrong
        testProcessVM.test?.timeUsed = testProcessVM.timeUsed
        testProcessVM.test?.accountId = authenticationVM.account.id.recordName
        if let test = testProcessVM.test {
            Task {
                let result = await CloudKitServer().save(record: test.record)
                
                switch result {
                    case .success:
                        print("Lo deberia de guardar")
                        isLoadingVM.isLoading = false
                        homeVM.inTest = false
                    
                    case .failure(let error):
                        print(error)
                }
                
                
            }
        } else {
            print("No se encontró el test")
        }
    }
    
    private func exitTest() { homeVM.inTest = false }
    
    private func endMessageAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.bouncy(duration: 1.5)){
                endMessage = 95
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
            withAnimation(.easeInOut(duration: 0.8)){
                endMessageAnimationDone = true
                endMessage = 60
            }
        }
    }
}

#Preview {
    TestFinishedView()
        .environmentObject(TestProcessViewModel())
}


struct StatisticCard<Content: View>: View {
    private let content: () -> Content
    private let text: String
    private let systemImage: String
    
    
    init(_ text: String, systemImage: String, @ViewBuilder content: @escaping () -> Content) {
        self.text = text
        self.systemImage = systemImage
        self.content = content
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white.opacity(0.4))
                .frame(maxWidth: .infinity)
                .blur(radius: 5)
                .clipShape(.rect(cornerRadius: 30))
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.white.opacity(0.8), lineWidth: 0.3)
            HStack {
                Image(systemName: systemImage)
                    .font(.largeTitle)
                Text(text)
                Spacer()
                content().font(.largeTitle)
            }
            .padding(.horizontal, 15)
        }
        .frame(height: 80)
    }
}
