//
//  Settings.swift
//  Spendific
//
//  Created by Pranav R on 25/06/24.
//

import SwiftUI

struct Settings: View {
    
    // User Properties
    @AppStorage("userName") private var userName: String = ""
    
    // App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("backgroundLockEnabled") private var backgroundLockEnabled: Bool = false
    
    var body: some View {
        NavigationStack {
            List(content: {
                Section("User Name", content: {
                    TextField("Enter your name", text: $userName)
                        .font(.settingsHeader)
                        .tracking(0.7)
                })
                .font(.custom("Poppins-Regular", size: 13))
                .tracking(0.7)
               
                
                Section("App Lock", content: {
                    Toggle("Enable App Lock", isOn: $isAppLockEnabled)
                        .font(.settingsHeader)
                        .tracking(0.7)
                    
                    if isAppLockEnabled {
                        Toggle("Background App Lock", isOn: $backgroundLockEnabled)
                            .font(.settingsHeader)
                            .tracking(0.7)
                    }
                })
                .font(.custom("Poppins-Regular", size: 13))
                .tracking(0.7)
                
                Section("Reset Data", content: {
                    // TODO: Reset all the app data (Maybe include a filter to choose custom date range as well ?)
                    Button(action: {
                        
                    }, label: {
                        Text("Reset All Expense Data")
                    })
                    .font(.settingsHeader)
                    .tracking(0.7)
                    
                    // TODO: Reset this Month's data (implement which month to delete choice ?)
                    Button(action: {
                        
                    }, label: {
                        Text("Reset Months Data")
                    })
                    .font(.settingsHeader)
                    .tracking(0.7)
                })
                .font(.custom("Poppins-Regular", size: 13))
                .tracking(0.7)
            })
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    Settings()
}
