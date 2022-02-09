import SwiftUI

public extension AppSettingsKit {
    struct ProfileImageModifier: ViewModifier {
        public func body(content: Content) -> some View {
            content
                .symbolVariant(.circle.fill)
                .font(.largeTitle)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue.opacity(0.6), .blue)
                .padding(.all, 8)
                .background(Circle().fill(.regularMaterial))
                .background(Circle().fill(.linearGradient(.init(colors: [.blue, .black.opacity(0.4)]), startPoint: .top, endPoint: .bottom)))
                .background(Circle().stroke(.gray.opacity(0.1), lineWidth: 4))
        }
    }

    struct ProfileEditModifier: ViewModifier {
        public func body(content: Content) -> some View {
            content
                .imageScale(.large)
                .overlay(
                    Rectangle()
                        .fill(.black.opacity(0.7))
                        .offset(y: 50)
                )
                .overlay(
                    Text("EDIT")
                        .font(.system(size: 9).weight(.light))
                        .foregroundColor(.white)
                        .offset(y: 25)
                )
                .mask(RoundedRectangle(
                    cornerRadius: 30,
                    style: .continuous
                )
                )
        }
    }
}

public extension Button where Label == ModifiedContent<Image, Kit.ProfileImageModifier> {
    init(systemName: String = "person.crop.circle.badge.checkmark", action: @escaping () -> Void) {
        self.init(action: action) {
            Image(systemName: systemName)
                .modifier(Kit.ProfileImageModifier())
        }
    }

    var editStyle: some View { modifier(Kit.ProfileEditModifier()) }
}

struct ProfileEditButtonPreview: PreviewProvider {
    static var previews: some View {
        Button {}
            .editStyle
    }
}
