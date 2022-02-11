import AppSettingsKit
import SwiftUI

@main
struct MainAppApp: App {
    var body: some Scene {
        WindowGroup {
            SettingsView()
                .onOpenURL { URL in
                    <#code#>
                }
        }
    }
}

struct RootView: View {
    let viewModel: SettingsViewModel
    
    var body: some View {
        
    }
}
