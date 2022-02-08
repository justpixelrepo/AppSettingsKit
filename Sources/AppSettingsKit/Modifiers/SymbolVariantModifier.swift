import KlugHelpers
import SwiftUI

public extension Kit {
    struct SymbolVariantModifier: ViewModifier {
        private let icon: Setting.Icon

        public init(
            _ icon: Setting.Icon
        ) {
            self.icon = icon
        }

        public func body(content: Content) -> some View {
            content
                .symbolVariant(icon.variant)
                .foregroundColor(icon.color)
                .frame(width: 35, height: 35)
                .background(
                    RoundedRectangle(
                        cornerSize: .init(width: 8, height: 8)
                    )
                    .fill(icon.fill)
                )
                .font(.title3)
        }
    }
}
