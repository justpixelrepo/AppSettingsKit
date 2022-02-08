import SwiftUI


public extension VStack where Content == Kit.ProfileEditView {
    init(
        profile: Kit.Setting.Profile
    ) {
        self.init { Kit.ProfileEditView(profile: profile) }
    }
}



struct VStackPreview: PreviewProvider {
    static var previews: some View {
        VStack(profile: .init(name: .init()))
    }
}

