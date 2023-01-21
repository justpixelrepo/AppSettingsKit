
import PlaygroundSupport
import SwiftUI

//public extension List where Content == HStack<Text> {
//    init(settings: [String]) {
//        self.init(settings, selection: .constant(.init())) { s in
//            HStack {
//                Text(s)
//            }
//        }
//    }
//}

struct _View: View {
    var body: some View {
        List((1...10).reversed(), id: \.self) {
                Text("\($0)…")
            }

    }
}

struct Preview: View {
    var body: some View {
        preview
           // .frame(width: 320)
    }

    var preview: some View {
        HStack {
            _View()
        }
    }
}

print(type(of: Preview().preview))

PlaygroundPage.current.setLiveView(Preview())
