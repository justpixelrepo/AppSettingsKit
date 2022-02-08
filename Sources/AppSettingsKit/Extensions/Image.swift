import SwiftUI

public extension Image {
    func setting(icon: Kit.Setting.Icon) -> some View {
        modifier(Kit.SymbolVariantModifier(icon))
    }

    var profile: some View {
        modifier(Kit.ProfileImageModifier())
    }
}

struct Image_Previews: PreviewProvider {
    static var previews: some View {
        Button {} label: {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .profile
        }
        .previewLayout(.sizeThatFits)
    }
}
