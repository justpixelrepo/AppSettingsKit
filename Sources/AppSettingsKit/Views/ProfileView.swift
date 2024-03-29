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
                    Text("\(profile.name.first) \(profile.name.last)")
                        .font(.title3)
                    Text("Apple ID, iCloud, Media \n & Purchases")
                        .font(.caption)
                        .lineLimit(2)
                }
            }
        }
    }
}

struct ProfileViewPreview: PreviewProvider {
    static var previews: some View {
        Kit.ProfileView(profile: .init(name: .init(), email: "any@mail.com"))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

