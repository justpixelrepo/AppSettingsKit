import SwiftUI

public extension Kit {
    enum ViewType {
        case toggle
        case text
        case subtitle
    }

    struct Setting: Identifiable {
        public let id = UUID().uuidString
        public var type: ViewType
        let title: String
        var subtitle: String
        var icon: Icon

        public init(
            type: ViewType = .text,
            title: String,
            subtitle: String = "",
            icon: Icon = .init()
        ) {
            self.type = type
            self.title = title
            self.subtitle = subtitle
            self.icon = icon
        }
    }
}

public extension Kit.Setting {
    struct Group: Identifiable {
        public let id = UUID().uuidString
        public var title: String
        var category: Category
        @ArrayBuilder public var settings: [Kit.Setting]

        public init(
            title: String = "",
            under type: Category,
            @ArrayBuilder settings: () -> [Kit.Setting]
        ) {
            self.title = title
            self.category = type
            self.settings = settings()
        }
    }
}

public extension Kit.Setting {
    enum Category {
        case profile
        case network
        case notifications
        case general
        case appStore
        case defaultApps
        case media
        case tv
        case developer
        case apps
        case account
        case icloud
        case devices
    }
}

public extension Kit.Setting {
    #warning("Make fill accomodate gradients")
 
    struct Icon {
        var fill = Color.clear
        var color = Color.white
        var symbol = Symbol.none
        var variant = SymbolVariants.fill
        
        public init() {}

        init(
            fill: Color = Color.clear,
            color: Color = Color.white,
            symbol: Kit.Setting.Symbol = .none,
            variant: SymbolVariants = .fill
        ) {
            self.fill = fill
            self.color = color
            self.symbol = symbol
            self.variant = variant
        }

      
    }
}
