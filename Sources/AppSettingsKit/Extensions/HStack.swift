import SwiftUI


#warning("After prototyping convert Model to use ViewModel aka Bindable")
public extension HStack where Content == Kit.ToggleView {
    init(
        setting: Kit.Setting,
        isOn: Binding<Bool>
    ) {
        self.init{ Kit.ToggleView(setting: setting, isOn: isOn) }
    }
}


