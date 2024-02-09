//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Balaji Venkatesh on 10/12/23.
//

import SwiftUI

struct TrackerContentView: View {
    /// Intro Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    /// App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    /// Active Tab
    @State private var activeTab: Tab = .recents
    var body: some View {
        LockView(lockType: .biometric, lockPin: "", isEnabled: isAppLockEnabled, lockWhenAppGoesBackground: lockWhenAppGoesBackground) {
            TabView(selection: $activeTab) {
                Recents()
                    .tag(Tab.recents)
                    .tabItem { Tab.recents.tabContent }
                
                Search()
                    .tag(Tab.search)
                    .tabItem { Tab.search.tabContent }
                
                Graphs()
                    .tag(Tab.charts)
                    .tabItem { Tab.charts.tabContent }
                
                TrackerSettingsView()
                    .tag(Tab.settings)
                    .tabItem { Tab.settings.tabContent }
            }
            .tint(appTint)
            .sheet(isPresented: $isFirstTime, content: {
                IntroScreen()
                    .interactiveDismissDisabled()
            })
        }
    }
}

#Preview {
    TrackerContentView()
}
