import SwiftUI

public extension Kit {
    struct HomeScreen: View {
        @Environment(\.colorScheme) var colorScheme
        var isDarkMode: Bool { colorScheme == .dark }
        @State private var isOn = false
        @ObservedObject var viewModel = SettingsModel()
        @State private var searchText = ""
        
        public init(
            viewModel: SettingsModel = .init()
        ) {
            self.viewModel = viewModel
        }
        
        public init() {}
        
        #warning("move to a view model or a child view model?")
        func bind(_ setting: Kit.Setting) -> Binding<Bool> {
            switch setting.icon.symbol {
            case .vpn: return $viewModel.isVPN
            default: return $viewModel.isAirplaneMode
            }
        }
        
        public var body: some View {
            NavigationView {
                Form {
                    Section {
                        NavigationLink {
                            VStack(profile: .init(name: .init()))
                        } label: {
                            Kit.ProfileView(profile: .init(name: .init()))
                        }
                        .searchable(text: $searchText)
                        NavigationLink {
                            Text("Any Text")
                        } label: {
                            Kit.FamilyView(family: .init())
                        }
                    }
                    
                    #warning("takes a configuration for localisation?")
                    List(Kit.Setting.main) { group in
                        Section {
                            List(group.settings) { setting in
                                switch setting.type {
                                case .toggle:
                                    HStack(setting: setting, isOn: bind(setting))
                                case .text, .subtitle:
                                    NavigationLink(
                                        setting: setting
                                    ) {
                                        setting.view()
                                       
                                    }
                                }
                            }
                            /// .listRowInsets(.init())
                            // .listRowBackground(Color.black.opacity(0.3))
                            .frame(height: 30)
                            // .background(Color.blue)
                        } header: {
                            Text(group.title)
                                .foregroundColor(.pink)
                        }
                    }
                    .navigationTitle("Settings")
                }
                .padding(0)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        Kit.HomeScreen().preferredColorScheme(.dark)
        Kit.HomeScreen(viewModel: {
            let svm = Kit.SettingsModel()
            // svm.isActive = true
            svm.isVPN = true
            return svm
        }())
    }
}
