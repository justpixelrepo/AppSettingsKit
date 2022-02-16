import AppSettingsKit
import SwiftUI

@main
struct MainAppApp: App {
    //let viewModel: Kit.SettingsViewModel = .init(route: .profile)
    //@State var openSupport = false
  
    var body: some Scene {
        WindowGroup {
            Kit.HomeScreen(viewModel: .init())

        }
    }
}

#warning("code to test Supporter library")
//            NavigationView {
//                Kit.HomeScreen(viewModel: .init())
//                    .toolbar {
//                        ToolbarItem {
//                            Button {
//                                openSupport.toggle()
//                            } label: {
//                                Image(systemName: "questionmark.circle.fill")
//                            }
//                        }
//                    }
//                    .fullScreenCover(isPresented: $openSupport) {
//                        SupportScreen()
//                    }
//            }
