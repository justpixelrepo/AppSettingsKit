import SwiftUI

public extension Kit {
    struct ProfileView: View {
        private let profile: Kit.Setting.Profile
        public init(
            profile: Kit.Setting.Profile
        ) {
            self.profile = profile
        }

        public var body: some View {
            HStack {
                Image(systemName: "person.crop.circle.badge.checkmark")
                    .profile

                VStack(alignment: .leading, spacing: 5) {
                    Text(profile.name.first)
                    Text("Apple ID, iCloud, iTunes & App Store")
                        .font(.caption2)
                }
            }
            .padding(.vertical, 4)
        }
    }

    struct ProfileEditView: View {
        @State var profile: Kit.Setting.Profile
        @ViewBuilder
        public var body: some View {
            Button(action: {})
                .editStyle
            Text(profile.name.first)
                .font(.title2)
                .foregroundColor(.white)
            Text(profile.email)
                .foregroundColor(.secondary)
                .font(.footnote)
            Form {
                List(Kit.Setting.profile) { group in
                    Section {
                        List(group.settings) { setting in
                            switch setting.type {
                            case .toggle:
                                HStack(setting: setting, isOn: .constant(true))
                            case .text, .subtitle:
                                NavigationLink(
                                    setting: setting
                                ) {
                                    Text("Any Text")
                                }
                            }
                        }
                    } header: {
                        Text(group.title)
                            .foregroundColor(.pink)
                    }
                }
            }
            Spacer()
                .navigationBarTitle("Apple ID", displayMode: .inline)
        }
    }
}
