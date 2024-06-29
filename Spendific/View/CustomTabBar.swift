//
//  CustomTabBar.swift
//  Spendific
//
//  Created by Pranav R on 26/06/24.
//

import SwiftUI

struct CustomTabBar: View {
    // View Properties
    @Binding var selectedTab: Tab
    
    // Environment Variables
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        HStack() {
            Button(action: {
                selectedTab = .home
            }, label: {
                customTabBarItem(label: "Home", iconName: "house.fill", isActive: selectedTab == .home)
            })

            
            Button(action: {
                selectedTab = .search
            }, label: {
                customTabBarItem(label: "Search", iconName: "magnifyingglass", isActive: selectedTab == .search)
            })

            
            Button(action: {
                selectedTab = .charts
            }, label: {
                customTabBarItem(label: "Charts", iconName: "chart.bar.xaxis", isActive: selectedTab == .charts)
            })

            
            Button(action: {
                selectedTab = .settings
            }, label: {
                customTabBarItem(label: "Settings", iconName: "gearshape", isActive: selectedTab == .settings)
            })
        }
        .frame(height: 106)
        .background(colorScheme == .dark ? .customGray : .white)
        .clipShape(.rect(topLeadingRadius: 30, topTrailingRadius: 30))
        .shadow(color: colorScheme == .light ? .gray.opacity(0.2) : .black.opacity(1), radius: 8)
    }
    
    @ViewBuilder
    func customTabBarItem(label: String, iconName: String, isActive: Bool) -> some View {
        GeometryReader { geo in
            
//            if isActive {
//                Rectangle()
//                    .foregroundStyle(appAccent.gradient)
//                    .frame(width: geo.size.width/2, height: 4)
//                    .padding(.leading, geo.size.width/4)
//            }
            
            VStack(alignment: .center, spacing: 4) {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 29, height: 29)
//                Text(label)
//                    .font(.caption)
            }
            .padding(.bottom, 30)
           .frame(width: geo.size.width, height: geo.size.height)
           .foregroundStyle(colorScheme == .dark ? isActive ? appAccent : .gray : isActive ? appTint : .gray)
        }
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.home))
}
