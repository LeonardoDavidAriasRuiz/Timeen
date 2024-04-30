//
//  HomeView.swift
//  Timeen
//
//  Created by Leonardo on 24/01/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeVM = HomeViewModel()
    
    @EnvironmentObject private var authenticationVM: AuthenticationViewModel
    @EnvironmentObject private var accountVM: AccountViewModel
    @EnvironmentObject private var bodyVM: BodyViewModel
    
    @State private var tests: [Test] = [
//        Test(number: 6, testType: .synonym, questions: []),
//        Test(number: 5, testType: .antonym, questions: []),
//        Test(number: 4, testType: .complete, questions: []),
//        Test(number: 3, testType: .conjugation, questions: []),
//        Test(number: 2, testType: .phrasalVerbs, questions: []),
//        Test(number: 1, testType: .translation, questions: [])
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        StreakIndicator()
                        Spacer()
                        ScoreIndicator()
                        Spacer()
                        NavigationLink(destination: ThemesView()) {
                            VStack {
                                Image(systemName: "pencil.and.list.clipboard").tint(.purple.darker()).font(.system(size: 25))
                                Text("Temas")
                                    .bold()
                                    .tint(.purple.darker())
                            }.padding(.horizontal, 5)
                        }
                        Spacer()
                    }
                    .background(.white.opacity(0.7))
                    .clipShape(.rect(cornerRadius: 20))
                    .shadow(radius: 10)
                    Text("Ruta").bold().font(.largeTitle)
                    ScrollView {
                        VStack {
                            RouteNextTestButton(action: startNewTest)
                            ForEach(tests, id: \.self) { test in
                                RouteLastTestButton(test: test, action: {})
                                    .padding(.leading, 190.0 * sin((Double.pi * 2 / Double(tests.count)) * Double(test.number)))
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .scrollIndicators(.hidden)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.7))
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.bottom)
                    .shadow(radius: 10)
                }
                .padding(.horizontal)
                
                BottomMenu()
            }
            .background(AuthenticationAnimatedBackground())
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $homeVM.inTest, destination: navigateToLessonsView)
            .onAppear(perform: loadPreviewsTests)
//            .navigationDestination(isPresented: $homeVM.selectingThemes, destination: {LessonsView()})
        }
        .environmentObject(homeVM)
    }
    
    private func loadPreviewsTests() {
        Task {
            let accountIdPredicate = NSPredicate(format: "\(Test.accountIdKey) == %@", authenticationVM.account.id.recordName)
            let compoundPredicate = NSCompoundPredicate(type: .and, subpredicates: [accountIdPredicate])
            let result = await CloudKitServer().fetchAll(recordType: "Tests", predicates: compoundPredicate)
            
            switch result {
                case .success(let records):
                    withAnimation {
                        self.tests = records.compactMap({ record in
                            return try? Test(record: record)
                        })
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    private func startNewTest() {
        homeVM.inTest = true
    }
    
    private func navigateToLessonsView() -> some View {
        withAnimation {
            return TestTypeView()
        }
    }
}

#Preview {
    BodyView()
        .environmentObject(IsLoadingViewModel())
        .environmentObject(AuthenticationViewModel())
}
