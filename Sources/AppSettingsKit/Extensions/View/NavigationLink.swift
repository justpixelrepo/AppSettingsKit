import KlugHelpers
import SwiftUI

public extension NavigationLink where Label == HStack<Kit.SettingView> {
    init(
        setting: Kit.Setting,
        @ViewBuilder destination: () -> Destination
    ) {
        self.init(
            //destination can be setting.view || setting.destination which is a view builder?
            destination: destination,
            label: {
                HStack { Kit.SettingView(setting: setting) }
            }
        )
    }
}

public extension NavigationLink where Label == Kit.ProfileView {
    init(
        profile: Kit.Setting.Profile,
        @ViewBuilder destination: () -> Destination
    ) {
        self.init(
            destination: destination,
            label: { Kit.ProfileView(profile: profile) }
        )
    }
}

public extension NavigationLink where Label == Kit.ProfileView {
    init(
        profile: Kit.Setting.Profile,
        isActive: Binding<Bool>,
        @ViewBuilder destination: () -> Destination
    ) {
        self.init(
            isActive: isActive,
            destination: destination,
            label: { Kit.ProfileView(profile: profile) }
        )
    }
}

public extension NavigationLink where Label == Kit.ProfileEditView {
    init(
        profileViewModel: Kit.ProfileViewModel,
        isActive: Binding<Bool>,
        @ViewBuilder destination: () -> Destination
    ) {
        self.init(
            isActive: isActive,
            destination: destination,
            label: { Kit.ProfileEditView(viewModel: profileViewModel) }
        )
    }
}





