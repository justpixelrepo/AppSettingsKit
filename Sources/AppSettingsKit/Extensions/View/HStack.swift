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

public extension HStack where Content == Kit.SettingView {
    init(
        setting: Kit.Setting
    ) {
        self.init{ Kit.SettingView(setting: setting) }
  
    }
}

//public extension List where Content == HStack<Kit.SettingView> {
//    init(settings: [Kit.Setting]) {
//        self.init(settings, id: \.self) { setting in
//            HStack {
//                Kit.SettingView(setting: setting)
//            }
//        }
//    }
//}


