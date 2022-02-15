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
}

struct ProfileViewPreview: PreviewProvider {
    static var previews: some View {
        Kit.ProfileView(profile: .init(name: .init(), email: "any@mail.com"))
            .padding()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}

