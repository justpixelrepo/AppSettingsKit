import SwiftUI


public extension Kit {
    struct MainScreen: View {
        @State var viewModel: SettingsViewModel
        
        public init(viewModel: SettingsViewModel) {
            self.viewModel = viewModel
        }
        
        @ViewBuilder
        public var body: some View {
            NavigationView {
                switch viewModel.route {
                case .home :  Kit.HomeScreen()
                case .profile : NavigationLink(isActive: .constant(true)) {
                    ProfileScreen(profile: .init(name: .init()))
                } label: {
                    Kit.HomeScreen()
                }
                }
            }
        }
    }
}
