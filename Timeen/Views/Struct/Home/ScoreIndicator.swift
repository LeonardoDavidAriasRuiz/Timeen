//
//  ScoreIndicator.swift
//  Timeen
//
//  Created by Leonardo on 21/04/24.
//

import SwiftUI

struct ScoreIndicator: View {
    var body: some View {
        VStack() {
            ScoreAnimatedIcon()
                .font(.system(size: 30))
            Text("9.3")
                .bold()
                .font(.system(size: 20))
                .foregroundStyle(Color(.blue))
        }
        .padding(5)
        .padding(.horizontal, 10)
    }
}

#Preview {
    ScoreIndicator()
}
