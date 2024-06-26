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
    
    // Environment variables
    @Environment(\.colorScheme) private var colorScheme
    
    // Tab View Properties
    @State private var currentTab: Tab = .home
    
    init() {
        let appear = UINavigationBarAppearance()

        let atters: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Poppins-Bold", size: 30)!
        ]
        
        let smallAtters: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Poppins-Bold", size: 15)!
        ]

        appear.largeTitleTextAttributes = atters
        appear.titleTextAttributes = smallAtters
        UINavigationBar.appearance().standardAppearance = appear
        UINavigationBar.appearance().compactAppearance = appear
//        UINavigationBar.appearance().scrollEdgeAppearance = appear
     }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentTab,
                    content:  {
                Group {
                    Home()
                        .tag(Tab.home)
                    Search()
                        .tag(Tab.search)
                    Graph()
                        .tag(Tab.charts)
                    Settings()
                        .tag(Tab.settings)
                }
                .toolbar(.hidden, for: .tabBar)
            })

            CustomTabBar(selectedTab: $currentTab)
        }
        .ignoresSafeArea()
        .sheet(isPresented: $isFirstTime, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    ContentView()
}
