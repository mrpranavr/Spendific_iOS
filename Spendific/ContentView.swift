//
//  ContentView.swift
//  Spendific
//
//  Created by Pranav R on 25/06/24.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    // Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    @AppStorage("enableDarkMode") private var enableDarkMode: Bool = false
    
    // App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @State private var isUnlocked: Bool = true
    @State private var noLockSet: Bool = false
    @State private var errorUnlock: Bool = false
    
    // Tab View Properties
    @State private var currentTab: Tab = .home
    //@State private var isFirstTime = true
    
    init() {
        let appear = UINavigationBarAppearance()

        let atters: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Poppins-SemiBold", size: 30)!,
            .tracking: 1
        ]
        
        let smallAtters: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Poppins-SemiBold", size: 15)!,
            .tracking: 1
        ]

        appear.largeTitleTextAttributes = atters
        appear.titleTextAttributes = smallAtters
        UINavigationBar.appearance().standardAppearance = appear
        UINavigationBar.appearance().compactAppearance = appear
     }
    
    var body: some View {
        VStack {
            if noLockSet && !isUnlocked {
                VStack {
                    Image(systemName: "lock.slash.fill")
                        .font(.largeTitle)
                    
                    Text("Enable device authentication in Settings to unlock your app.")
                        .font(.subHeader)
                        .tracking(0.7)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                        .padding(.top, 10)
                }
            }
            
            if errorUnlock && !isUnlocked {
                VStack {
                    Image(systemName: "lock.slash.fill")
                        .font(.largeTitle)
                    
                    Text("Apologies, an error occured while authencation. Please retry again.")
                        .font(.subHeader)
                        .tracking(0.7)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                        .padding(.top, 10)
                    
                    Button(action: {
                        authenticateUser()
                    }, label: {
                        Text("Try Again")
                    })
                    .font(.subHeader)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundStyle(.white)
                    .background(appAccent, in: .rect(cornerRadius: 15))
                    .padding(.top, 30)
                }
            }
            
            // APP UNLOCKED CONTENT
            if ((!isAppLockEnabled) || (isAppLockEnabled && isUnlocked)) {
                ZStack(alignment: .bottom) {
                    TabView(selection: $currentTab,
                            content:  {
                        Group {
                            Home(currentPage: $currentTab)
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
                    //  .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    CustomTabBar(selectedTab: $currentTab)
                }
                .ignoresSafeArea()
                .tint(appAccent)
                .sheet(isPresented: $isFirstTime, content: {
                    IntroScreen()
                        .interactiveDismissDisabled()
                        .environment(\.colorScheme, enableDarkMode ? .dark : .light)
                })
                .environment(\.colorScheme, enableDarkMode ? .dark : .light)
            }
        }
        .onAppear(
            perform: {
                if isAppLockEnabled {
                    authenticateUser()
                }
            }
        )
        .onChange(of: isAppLockEnabled) {
            item in
            if isAppLockEnabled {
                authenticateUser()
            }
        }
    }
    
    func authenticateUser() {
        let context = LAContext()
        var error: NSError?
        
        // Check if authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Unlock Spendific App"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) {
                success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    errorUnlock = true
                }
            }
        } else {
            noLockSet = true
        }
    }
}

#Preview {
    ContentView()
}
