//
//  TestProcessView.swift
//  Timeen
//
//  Created by Leonardo on 11/03/24.
//

import SwiftUI

struct TestProcessView: View {
    @StateObject private var testProcessVM: TestProcessViewModel = TestProcessViewModel()
    
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    let testType: TestType
    
    var body: some View {
        Section {
            switch testProcessVM.testProcess {
                case .loading:
                    LoadingTestView()
                case .practicing:
                    if let test = testProcessVM.test {
                        TestView(test: test)
                    } else {
                        Text("Error: No se pudo cargar la prueba")
                    }
                case .done:
                    TestFinishedView()
            }
        }
        .alert("Sucedió un error al cargar la prueba.", isPresented: $testProcessVM.errorLoadingTest, actions: {})
        .navigationBarBackButtonHidden()
        .onAppear(perform: loadTest)
        .environmentObject(testProcessVM)
    }
    
    private func loadTest() {
        
        let message = QuestionsRequestMessage.request(testType: testType, account: authenticationVM.account)
        let body = OpenAICompletionsBody(messages: [message])
        Task {
            let result = await OpenIAServer().sendMessage(body: body)
            
            DispatchQueue.main.async {
                guard
                    case .success(let chatCompletion) = result,
                    let response = chatCompletion.choices.map({ $0.message }).last
                else {
                    testProcessVM.errorLoadingTest = true
                    dismiss()
                    return
                }
                let jsonString = response.content
                let jsonData = Data(jsonString.utf8)
                
                do {
                    var newTest = try JSONDecoder().decode(Test.self, from: jsonData)
                    for index in newTest.questions.indices {
                        newTest.questions[index].options = newTest.questions[index].options.shuffled()
                    }
                    testProcessVM.test = newTest
                    testProcessVM.testProcess = .practicing
                } catch {
                    print(error)
                    testProcessVM.errorLoadingTest = true
                    dismiss()
                    return
                }
            }
        }
    }
}

#Preview {
    TestProcessView(testType: .conjugation)
        .environmentObject(AuthenticationViewModel())
}
