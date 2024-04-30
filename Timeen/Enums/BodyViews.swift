//
//  BodyViews.swift
//  Timeen
//
//  Created by Leonardo on 23/02/24.
//

import SwiftUI

enum BodyViews: CaseIterable {
    case home
    case statistics
    case account
    
    var name: String {
        switch self {
            case .home: "Home"
            case .statistics: "Statistics"
            case .account: "Account"
        }
    }
    
    var view: some View {
        VStack {
            switch self {
                case .home: HomeView()
                case .statistics: StatisticsView()
                case .account: AccountView()
            }
        }
    }
}
