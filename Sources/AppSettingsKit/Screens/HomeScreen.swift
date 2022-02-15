import KlugHelpers
import SwiftUI

public extension Kit {
    struct HomeScreen: View {
        @Environment(\.colorScheme) var colorScheme
        var isDarkMode: Bool { colorScheme == .dark }
        @State private var isOn = false
        @ObservedObject var viewModel = SettingsViewModel()
        
        public init(
            viewModel: SettingsViewModel = .init()
        ) {
            self.viewModel = viewModel
        }
        
        public init() {}
        
        public var body: some View {
            NavigationView {
                Form {
                    Section {
                        NavigationLink(
                            profile: .init(name: .init()),
                            isActive: $viewModel.isActive
                        ) {
                            VStack(profile: .init(name: .init()))
                        }
                    }
                    
                    List(Kit.Setting.main) { group in
                        Section {
                            List(group.settings) { setting in
                                switch setting.type {
                                case .toggle:
                                    HStack(setting: setting, isOn: $isOn)
                                case .text, .subtitle:
                                    NavigationLink(
                                        setting: setting
                                    ) {
                                        //settings.view
                                        Text("\(.any)")
                                    }
                                }
                            }
                        } header: {
                            Text(group.title)
                                .foregroundColor(.pink)
                        }
                    }
                    .navigationTitle("Settings")
                }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        Kit.HomeScreen().preferredColorScheme(.dark)
        
        Kit.HomeScreen()
    }
}