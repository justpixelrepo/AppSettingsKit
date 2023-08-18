import SwiftUI

public extension View {
    func center() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
