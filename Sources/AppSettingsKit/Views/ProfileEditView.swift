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

        @ViewBuilder
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
                        Button("Edit") {}
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
                
                Section {
                    HStack(
                        setting: .init(title: "Apps, music, TV and more"),
                        isOn: $viewModel.isNotifications)
                } footer: {
                    VStack(alignment: .leading, spacing: 32) {
                        Text("Receive new releases, exclusive content, special offers and recommendations for apps, music, movies, TV, books, podcasts and more.")
                        
                        Button("See how your data is managed...") {
                            viewModel.isManagedDataSheet = true
                        }
                            .controlSize(.large)
                            .center()
                        
                    }
                }
            }
            .sheet(isPresented:  $viewModel.isManagedDataSheet) {
                NavigationView {
                    VStack(alignment: .center, spacing: 22) {
                           Image(systemName: "person.2")
                            .font(.system(size: 50))
                            .imageScale(.large)
                            .symbolVariant(.fill)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.blue.opacity(0.6), .blue)
                            
                           Text("Apple ID & Privacy")
                            .font(.title.bold())
                           Text("Apple ID & Privacy  Apple ID is designed to protect your  information and enable you to choose what  you share.  \n\n When you sign in with your Apple ID,  you will enable services such as iCloud,  the App Store, iMessage and Find My on this iPhone.  \n\n  Certain data, including your contacts,  calendars, photos, documents, health,  activity and other app data, will be sent  to Apple to store and back up on your  behalf.  \n\n  In addition, your device will be  associated with your Apple ID to   provide you with better service and  support.  \n\n Your Apple ID and all Apple services are designed  from the ground up to protect your privacy.   \n\n We work hard to collect only the data we need to make your experience better. When we do collect data, we believe it's important for you to know what we're collecting and why we need it, so you can make informed choices. ")
                            .multilineTextAlignment(.center)
                        
                        Button("Learn how your data is managed...") {
                            
                        }
                            .controlSize(.large)
                            .center()
                        
                       }
                    .padding()
                    .toolbar {
                        ToolbarItem {
                            Button("Done") {
                                viewModel.isManagedDataSheet = false
                            }
                        }
                    }
                    .ignoresSafeArea()
                }
            }
            
        }
    }
}

//struct ProfileEditPreview: PreviewProvider {
//    static var previews: some View {
//        Kit.ProfileEditView(viewModel: .init())
//    }
//}
