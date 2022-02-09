import SwiftUI

public extension Kit {
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


