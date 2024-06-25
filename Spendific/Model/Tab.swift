//
//  Tab.swift
//  Spendific
//
//  Created by Pranav R on 25/06/24.
//

import SwiftUI

enum Tab: String {
    case home, search, charts, settings
    
    @ViewBuilder
    var tabContent: some View {
        switch self {
        case .home:
            Image(systemName: "house.fill")
//            Text(self.rawValue.capitalized)
        case .search:
            Image(systemName: "magnifyingglass")
//            Text(self.rawValue.capitalized)
        case .charts:
            Image(systemName: "chart.bar.xaxis")
//            Text(self.rawValue.capitalized)
        case .settings:
            Image(systemName: "gearshape")
//            Text(self.rawValue.capitalized)
        }
    }
}
