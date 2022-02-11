import SwiftUI


public extension Kit {
    struct MainScreen: View {
        @ObservedObject var viewModel: SettingsViewModel
        
        public init(viewModel: SettingsViewModel) {
            self.viewModel = viewModel
        }
        
        public var body: some View {
            NavigationView {
                switch viewModel.route {
                case .home :  Kit.HomeScreen(viewModel: viewModel)
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
