//
//  ContentView.swift
//  Spendific
//
//  Created by Pranav R on 25/06/24.
//

import SwiftUI

struct ContentView: View {
    // Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    // Tab View Properties
    @State private var currentTab: Tab = .home
    
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
            Home()
                .tag(Tab.home)
                .tabItem { Tab.home.tabContent }
            Search()
                .tag(Tab.search)
                .tabItem { Tab.search.tabContent }
            Graph()
                .tag(Tab.charts)
                .tabItem { Tab.charts.tabContent }
            Settings()
                .tag(Tab.settings)
                .tabItem { Tab.settings.tabContent }
        })
        .tint(appTint)
        .sheet(isPresented: $isFirstTime, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    ContentView()
}
