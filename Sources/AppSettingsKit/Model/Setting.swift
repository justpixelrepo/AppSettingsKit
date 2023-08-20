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
        var footer: String = .empty
        var header: String = .empty
        var icon: Icon
        let view: ([Kit.Setting.Group], String) -> AnyView

        public init<Content: View>(
            type: ViewType = .text,
            title: String,
            subtitle: String = "",
            icon: Icon = .init(),
            @ViewBuilder view: @escaping ([Kit.Setting.Group], String) -> Content = { _, title in Text("\(title)") }
        ) {
            self.type = type
            self.title = title
            self.subtitle = subtitle
            self.icon = icon
            #warning("Lets not use AnyView")
            self.view = { groups, title in AnyView(view(groups, title)) }
        }
    }
}

public extension Kit.Setting {
    struct Group: Identifiable {
        public let id = UUID().uuidString
        public var title: String
        var category: Category
        @ArrayBuilder public var settings: [Kit.Setting]
        @GroupBuilder public var groups: [Kit.Setting.Group]

        public init(
            title: String = "",
            under type: Category,
            @ArrayBuilder settings: () -> [Kit.Setting],
            @GroupBuilder groups: () -> [Kit.Setting.Group] = { [] }
        ) {
            self.title = title
            self.category = type
            self.settings = settings()
            self.groups = groups()
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
        case animation
        case interaction
        case apps
        case account
        case icloud
        case devices
        case exploration
        case ui
        case data
    }
}

public extension Kit.Setting {
    #warning("Make fill accomodate gradients")
    #warning("Add an image version to accomodate custom images")

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
