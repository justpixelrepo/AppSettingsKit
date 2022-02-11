import AppSettingsKit
import SwiftUI

@main
struct MainAppApp: App {
    let viewModel: SettingsViewModel = .init(route: .profile)
    
    var body: some Scene {
        WindowGroup {
            Kit.MainScreen(viewModel: viewModel)
                .onOpenURL { viewModel.open(url: $0)}
        }
    }
}


