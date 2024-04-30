//
//  TestTypeView.swift
//  Timeen
//
//  Created by Leonardo on 14/02/24.
//

import SwiftUI

struct TestTypeView: View {
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationStack {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(TestType.all, id: \.self) { type in
                    NavigationLink(destination: TestProcessView(testType: type)) {
                        VStack {
                            Text(type.title)
                                .bold()
                                .font(.title)
                                .tint(type.color.darker())
                            LottieIcon(name: type.lottieIconColoredName, speed: 0.5, size: 100)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.white)
                        .clipShape(.rect(cornerRadius: 40))
                        .shadow(radius: 5)
                    }
                    .padding(5)
                }
            }
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.background))
            .navigationTitle("Lecciones")
        }
    }
}

#Preview {
    TestTypeView()
}
