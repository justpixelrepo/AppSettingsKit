import RoutingHelpers
import Foundation
import SwiftUI

public class SettingsViewModel: ObservableObject {
    @Published var route: Kit.Route
    
    public init(
        route: Kit.Route
    ) {
        self.route = route
    }

    public func open(url: URL) {
        switch url.path {
        case "/profile" :
            route = .profile
        default:
            route = .home
        }
//        var request = DeepLinkRequest(url: url)
//        if let route = deepLinker.parse(&request) {
//            switch route {
//            case .one:
//                self.selectedTab = .one
//
//            case let .inventory(inventoryRoute):
//                self.selectedTab = .inventory
//                self.inventoryViewModel.navigate(to: inventoryRoute)
//
//            case .three:
//                self.selectedTab = .three
//            }
     //   }
    }
}
