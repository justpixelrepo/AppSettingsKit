import Foundation

extension Kit {
    public class ProfileViewModel: ObservableObject {
        @Published public var route = Kit.Route.profile
        @Published public var profile: Setting.Profile = .init(name: .init())
        @Published public var isActive = true
        @Published public var isSubscription = true
        @Published public var isNotifications = true
        
        public init() {}
        public init(
            route: Kit.Route
        ) {
            self.route = route
        }
        
        
    }
}
