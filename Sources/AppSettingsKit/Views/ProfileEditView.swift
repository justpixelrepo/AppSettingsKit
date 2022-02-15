import SwiftUI

public extension Kit {
    struct ProfileEditView: View {
        @ObservedObject var viewModel: Kit.ProfileViewModel = .init()
        private var profile: Setting.Profile { viewModel.profile }
        
        @Setting.ArrayBuilder
        private var settings: [Kit.Setting] {
            Setting(type: .subtitle, title: profile.email, subtitle: "Apple ID")
            Setting(type: .subtitle, title: profile.number, subtitle: "iMessage & FaceTime number")
            Setting(title: profile.altEmail)
        }

        public var body: some View {
            Form {
                Section {
                    NavigationLink(
                        setting: .init(title: profile.name.fullName)) {
                            Text("\(.any)")
                        }
                } header: {
                    Text("NAME")
                }
                
                Section {
                    List(settings) { setting in
                        HStack(setting: setting)
                    }
                } header: {
                    HStack {
                        Text("Contactable at")
                        Spacer()
                        Button {} label: {
                            Text("Edit")
                        }
                    }
                } footer: {
                    Text("These phone numbers and email addresses can be used to contact you via iMessage, FaceTime, Game Center and more.")
                }
                
                Section {
                    HStack(setting: .init(title: "Date of birth", subtitle: profile.DOB))
                }
                
                Section {
                    HStack(
                        setting: .init(title: "Announcement"),
                        isOn: $viewModel.isSubscription)
                } footer: {
                   Text("Receive announcements, recommendations and updates about Apple products, services and software")
                }
                
            }
        }
    }
}

struct ProfileEditPreview: PreviewProvider {
    static var previews: some View {
        Kit.ProfileEditView(viewModel: .init())
    }
}
