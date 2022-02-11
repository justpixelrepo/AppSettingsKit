import RoutingHelpers
import Foundation
import SwiftUI
import Parsing

public class SettingsViewModel: ObservableObject {
     @Published public var route: Kit.Route
    
    let deepLinker = PathComponent("home").map{ Kit.Route.home }
        .orElse(PathComponent("profile").map { .profile })
    
    public init(
        route: Kit.Route
    ) {
        self.route = route
    }
    

    public func open(url: URL) {
        var request = DeepLinkRequest(url: url)
        if let route = deepLinker.parse(&request) {
            self.route = route
        }
    }
}
