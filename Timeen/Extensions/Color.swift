//
//  Color.swift
//  Timeen
//
//  Created by Leonardo on 29/02/24.
//

import SwiftUI

extension Color {
    func darker() -> Color {
        let uiColor = UIColor(self)
        var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
        if uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return Color(UIColor(hue: hue, saturation: saturation, brightness: brightness * 0.8, alpha: alpha))
        } else {
            return self
        }
    }
}
