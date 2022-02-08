import SwiftUI

public extension Kit {
    struct SettingView: View {
        private let setting: Kit.Setting
        @State private var badgeCount = 0
        init(
            setting: Kit.Setting
        ) {
            self.setting = setting
        }

        public var body: some View {
            HStack {
                image
                title
                Spacer()
             //   subtitle
                badge
            }
        }

        @ViewBuilder
        var subtitle: some View {
            if !setting.subtitle.isEmpty {
                Text(setting.subtitle)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }

        @ViewBuilder
        var title: some View {
            if setting.type == .text {
                Text(setting.title)
            } else if setting.type == .subtitle {
                VStack {
                    Text(setting.title)
                    subtitle
                }
            }
        }

        @ViewBuilder
        var image: some View {
            if setting.icon.symbol != .none {
                Image(
                    systemName: setting.icon.symbol.description
                )
                .setting(icon: setting.icon
                )
            }
        }

        @ViewBuilder
        var badge: some View {
            if badgeCount > 0 && badgeCount <= 99 {
                Circle()
                    .fill(.red)
                    .frame(width: 20)
                    .overlay {
                        Text("\(badgeCount)")
                            .font(.caption2.bold())
                            .foregroundColor(.white)
                    }
            }
        }
    }
}
