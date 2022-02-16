import Foundation
import SwiftUI

extension Kit {
    public class SettingsViewModel: ObservableObject {
        @Published public var route = Kit.Route.home
        
        #warning("we cannot have more than 10 of this")
        //Possible solution
        //Register a name of saving the state of each Bool setting
        //Dynamically generate a bindable object which each encounter
        @Published public var isActive = false
        @Published public var isAirplaneMode = false
        @Published public var isVPN = false 
        
        public init() {}
        public init(
            route: Kit.Route
        ) {
            self.route = route
        }
        
        
    }
}
