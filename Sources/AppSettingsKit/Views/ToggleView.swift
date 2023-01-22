import SwiftUI

public extension Kit {
    struct ToggleView: View {
        private let setting: Setting
        private let isOn: Binding<Bool>
         
        init(setting: Setting, isOn: Binding<Bool>) {
            self.setting = setting
            self.isOn = isOn
        }
        
        @ViewBuilder
        public var body: some View {
            if setting.icon.symbol != .none {
            Image(systemName: setting.icon.symbol.description)
                .setting(icon: setting.icon)
                .padding(.trailing, 8)
   
            Spacer()
            }
            Toggle(isOn: isOn) {
                Text(setting.title)
                    .font(.body)
            }
        }
    }
}
