import SwiftUI


public extension VStack where Content == Kit.ProfileScreen {
    init(
        profile: Kit.Setting.Profile
    ) {
        self.init { Kit.ProfileScreen(profile: profile) }
    }
}



struct VStackPreview: PreviewProvider {
    static var previews: some View {
        VStack(profile: .init(name: .init()))
    }
}

