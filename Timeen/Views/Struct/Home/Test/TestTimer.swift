//
//  TestTimer.swift
//  Timeen
//
//  Created by Leonardo on 08/03/24.
//

import SwiftUI

struct TestTimer: View {
    @EnvironmentObject private var testProcessVM: TestProcessViewModel
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var secondsLeft: Double
    let totalTime: Double
    let actionWhenEnd: () -> Void
    
    init(totalTime: Double, actionWhenEnd: @escaping () -> Void) {
        self.secondsLeft = totalTime
        self.totalTime = totalTime
        self.actionWhenEnd = actionWhenEnd
    }
    
    var body: some View {
        HStack {
            ProgressView(value: secondsLeft, total: 60)
                .progressViewStyle(.linear)
            
            Text(String(format: "%.0f s", secondsLeft))
        }
        .onReceive(timer, perform: reduceOneSecond)
        .onChange(of: secondsLeft, setTimeUsed)
    }
    
    private func reduceOneSecond(timer: Date) {
        if secondsLeft > 0 {
            secondsLeft -= 1
            if secondsLeft == 0 {
                actionWhenEnd()
            }
        }
    }
    
    private func setTimeUsed() {
        testProcessVM.timeUsed = Int(totalTime - secondsLeft)
    }
}

//#Preview {
//    TestTimer(secondsLeft: 70) { }
//}
