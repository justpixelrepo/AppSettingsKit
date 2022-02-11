import Foundation
import SwiftUI

extension Kit {
    public class SettingsViewModel: ObservableObject {
        @Published public var route = Kit.Route.home
        @Published public var isProfileActive = true
        
        public init() {}
        public init(
            route: Kit.Route
        ) {
            self.route = route
        }
        
        
    }
}
