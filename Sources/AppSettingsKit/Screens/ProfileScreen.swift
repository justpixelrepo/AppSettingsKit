import SwiftUI

public extension Kit {
    struct ProfileScreen: View {
        @State var profile: Kit.Setting.Profile
        
        @ViewBuilder
        public var body: some View {
            //  header
            settings
                .navigationBarTitle("Apple ID", displayMode: .inline)
        }
        
        @ViewBuilder
        var header: some View {
            Button(action: {})
                .editStyle
        }
        
        var settings: some View {
            Form {
                Section {} header: {
                    VStack {
                        Button(action: {})
                            .editStyle
                        Text(profile.name.first)
                            .font(.title2.lowercaseSmallCaps())
                            .foregroundColor(.white)
                        Text(profile.email)
                            .foregroundColor(.secondary)
                            .font(.footnote)
                    }
                    .center()
                    
                }
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
                                    Kit.ProfileEditView()
                                }
                            }
                        }
                    } header: {
                        Text(group.title)
                            .foregroundColor(.pink)
                    }
                }
                Section {
                    Button("Sign Out") {}
                        .tint(.red)
                        .center()
                }
            }
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Kit.ProfileScreen(
                profile: .init(name: .init())
            )
            .preferredColorScheme(.dark)
        }
    }
}
