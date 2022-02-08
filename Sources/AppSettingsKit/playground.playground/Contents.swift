import Klug
import PlaygroundSupport
import SwiftUI

struct _SymbolVariantsModifier: ViewModifier {
    private let variant: SymbolVariants

    init(_ variant: SymbolVariants) {
        self.variant = variant
    }

    func body(content: Content) -> some View {
        content.symbolVariant(variant)
    }
}

struct Preview: View {
    var body: some View {
        preview
           // .frame(width: 320)
    }

    var preview: some View {
        Image(systemName: "swift").modifier(_SymbolVariantsModifier(.none))
    }
}

print(type(of: Preview().preview))

PlaygroundPage.current.setLiveView(Preview())
