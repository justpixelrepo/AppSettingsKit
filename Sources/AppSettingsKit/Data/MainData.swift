public extension Kit.Setting {
    
    @GroupBuilder
    static var main: [Group] {
        
        Group(under: .network) {
            Kit.Setting(type: .toggle, title: "Airplane Mode", icon: .init(fill: .blue, symbol: .airplane))
            Kit.Setting(title: "Wi-Fi", subtitle: "Swift", icon: .init(fill: .blue, symbol: .wifi))
            Kit.Setting(title: "Bluetooth", subtitle: "On", icon: .init(fill: .blue, symbol: .bluetooth))
            Kit.Setting(title: "Mobile Data", icon: .init(fill: .green, symbol: .mobileData))
            Kit.Setting(title: "Personal Hotspot", icon: .init(fill: .green, symbol: .personalHotspot))
            Kit.Setting(type: .toggle, title: "VPN", icon: .init(fill: .blue, symbol: .vpn))
        }

        Group(under: .notifications) {
            Kit.Setting(title: "Notifications", icon: .init(fill: .red, symbol: .notifications))
            Kit.Setting(title: "Sounds & Haptics", icon: .init(fill: .red, symbol: .soundsAndHaptic))
            Kit.Setting(title: "Focus",  icon: .init(fill: .indigo, symbol: .focus))
            Kit.Setting(title: "Screen Time", icon: .init(fill: .indigo, symbol: .screenTime))
        }

        Group(under: .general) {
            Kit.Setting(title: "General", icon: .init(fill: .gray, symbol: .general))
            Kit.Setting(title: "Control Center", icon: .init(fill: .gray, symbol: .controlCenter))
            Kit.Setting(title: "Display & Brightness", icon: .init(fill: .blue, symbol: .displayAndBrightness))
//            Kit.Setting(color: .indigo, title: "Home Screen", symbol: .homeScreen)
//            Kit.Setting(color: .blue.opacity(0.7), title: "Accessibility", symbol: .accessibility)
//            Kit.Setting(color: .blue.opacity(0.5), title: "Wallpaper", symbol: .wallpaper)
//            Kit.Setting(color: .indigo, title: "Siri & Search", symbol: .siriAndSearch)
//            Kit.Setting(color: .green, title: "Face ID & Passcode", symbol: .faceIdAndPasscode)
//            Kit.Setting(color: .red, title: "Emergency SOS", symbol: .emergencySOS)
//            Kit.Setting(color: .pink, title: "Exposure Notifications", symbol: .exposureNotifications)
//            Kit.Setting(color: .green, title: "Battery", symbol: .battery)
//            Kit.Setting(color: .blue, title: "Privacy", symbol: .privacy)
        }
    }
}
