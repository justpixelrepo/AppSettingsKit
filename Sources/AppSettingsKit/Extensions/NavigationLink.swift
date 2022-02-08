import KlugHelpers
import SwiftUI

public extension NavigationLink where Label == Kit.SettingView {
    init(
        setting: Kit.Setting,
        @ViewBuilder destination: () -> Destination
    ) {
        self.init(
            //destination can be setting.view || setting.destination which is a view builder?
            destination: destination,
            label: { Kit.SettingView(setting: setting) }
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


