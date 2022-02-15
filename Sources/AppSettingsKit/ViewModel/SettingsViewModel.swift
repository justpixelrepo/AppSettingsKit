import Foundation
import SwiftUI

extension Kit {
    public class SettingsViewModel: ObservableObject {
        @Published public var route = Kit.Route.home 
        @Published public var isActive = false 
        
        public init() {}
        public init(
            route: Kit.Route
        ) {
            self.route = route
        }
        
        
    }
}
