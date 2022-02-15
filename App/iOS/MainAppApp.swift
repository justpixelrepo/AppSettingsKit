import AppSettingsKit
import SwiftUI

@main
struct MainAppApp: App {
    let viewModel: Kit.SettingsViewModel = .init(route: .profile)
    
    var body: some Scene {
        WindowGroup {
            Kit.HomeScreen(viewModel: .init())
        }
    }
}


