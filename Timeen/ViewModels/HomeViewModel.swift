//
//  HomeViewModel.swift
//  Timeen
//
//  Created by Leonardo on 01/04/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var inTest: Bool = false
    @Published var selectingThemes: Bool = false
}
