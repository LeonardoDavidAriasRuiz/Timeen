//
//  AboutView.swift
//  Timeen
//
//  Created by Leonardo on 22/02/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        List {
            Button("Animated icons by Lordicon.com") {
                if let url = URL(string: "https://lordicon.com/") {
                    UIApplication.shared.open(url)
                }
            }
        }
        .navigationTitle("About")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if let uiImage = UIImage(named: "LogoGrayBackground") {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 40, height: 40)
                } else {
                    Text("No se pudo cargar el Logo")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AboutView()
    }
}
