//
//  StreakIdicator.swift
//  Timeen
//
//  Created by Leonardo on 27/02/24.
//

import SwiftUI

struct StreakIndicator: View {
    
    var body: some View {
        VStack() {
            StreakAnimatedIcon()
                .font(.system(size: 30))
            Text("8")
                .bold()
                .font(.system(size: 20))
                .foregroundStyle(.red)
        }
        .padding(5)
        .padding(.horizontal, 10)
    }
}

#Preview {
    StreakIndicator()
}
