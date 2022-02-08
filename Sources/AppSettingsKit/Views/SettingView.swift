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
                if setting.type == .text { subtitle }
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
            switch setting.type {
            case .text :
                Text(setting.title)
            case .subtitle :
                VStack(alignment: .leading, spac) {
                    Text(setting.title)
                    subtitle.font(.caption)
                }
            default : EmptyView()
            }
        }
        
        @ViewBuilder
        var image: some View {
            let systemName = setting.icon.symbol.description
            if setting.icon.symbol != .none {
                Image(systemName: systemName)
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


struct SettingPreview: PreviewProvider {
    static var previews: some View {
        Group {
            Kit.SettingView(setting: .init(title: "Any Title"))
            Kit.SettingView(setting: .init(title: "Any Title", subtitle: "Any Subtitle"))
            Kit.SettingView(setting: .init(type: .subtitle, title: "Any Title", subtitle: "Any Subtitle", icon: .init()))
        }
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
    }
}
