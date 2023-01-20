import SwiftUI

public extension View {
    var center: some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
