import SwiftUI

public extension Kit {
    struct ProfileEditView: View {
        @State var profile: Kit.Setting.Profile

        @ViewBuilder
        public var body: some View {
            header
            settings
            Spacer()
                .navigationBarTitle("Apple ID", displayMode: .inline)
        }

        @ViewBuilder
        var header: some View {
            Button(action: {})
                .editStyle
            Text(profile.name.first)
                .font(.title2)
                .foregroundColor(.white)
            Text(profile.email)
                .foregroundColor(.secondary)
                .font(.footnote)
        }

        var settings: some View {
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
        }
    }
}