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
            Kit.Setting(title: "Focus", icon: .init(fill: .indigo, symbol: .focus))
            Kit.Setting(title: "Screen Time", icon: .init(fill: .indigo, symbol: .screenTime))
        }

        Group(under: .general) {
            Kit.Setting(title: "General", icon: .init(fill: .gray, symbol: .general))
            Kit.Setting(title: "Control Center", icon: .init(fill: .gray, symbol: .controlCenter))
            Kit.Setting(title: "Display & Brightness", icon: .init(fill: .blue, symbol: .displayAndBrightness))
            Kit.Setting(title: "Home Screen", icon: .init(fill: .indigo, symbol: .homeScreen))
            Kit.Setting(title: "Accessibility", icon: .init(fill: .blue.opacity(0.7), symbol: .accessibility))
            Kit.Setting(title: "Wallpaper", icon: .init(fill: .blue.opacity(0.5), symbol: .wallpaper))
            Kit.Setting(title: "Siri & Search", icon: .init(fill: .indigo, symbol: .siriAndSearch))
            Kit.Setting(title: "Face ID & Passcode", icon: .init(fill: .green, symbol: .faceIdAndPasscode))
            Kit.Setting(title: "Emergency SOS", icon: .init(fill: .red, symbol: .emergencySOS))
            Kit.Setting(title: "Exposure Notifications", icon: .init(fill: .pink, symbol: .exposureNotifications))
            Kit.Setting(title: "Battery", icon: .init(fill: .green, symbol: .battery))
            Kit.Setting(title: "Privacy", icon: .init(fill: .blue, symbol: .privacy))
        }
        
        Group(under: .appStore) {
            Kit.Setting(title: "App Store", icon: .init(fill: .blue, symbol: .appStore))
            Kit.Setting(title: "Wallet", icon: .init(fill: .black, symbol: .wallet))
        }
        
        Group(under: .defaultApps) {
            Kit.Setting(title: "Passwords", icon: .init(fill: .gray, symbol: .passwords))
            Kit.Setting(title: "Mail", icon: .init(fill: .blue, symbol: .mail))
            Kit.Setting(title: "Contacts", icon: .init(fill: .gray, symbol: .contacts))
            Kit.Setting(title: "Calendar", icon: .init(fill: .green, symbol: .calendar))
            Kit.Setting(title: "Notes", icon: .init(fill: .yellow, symbol: .notes))
            Kit.Setting(title: "Reminders", icon: .init(fill: .purple, symbol: .reminders))
            Kit.Setting(title: "Freeform", icon: .init(fill: .pink, symbol: .freeform))
            Kit.Setting(title: "Voice Memos", icon: .init(fill: .red, symbol: .voiceMemos))
            Kit.Setting(title: "Phone", icon: .init(fill: .green, symbol: .phone))
            Kit.Setting(title: "Messages", icon: .init(fill: .green, symbol: .messages))
            Kit.Setting(title: "FaceTime", icon: .init(fill: .green, symbol: .facetime))
            Kit.Setting(title: "Safari", icon: .init(fill: .blue, symbol: .safari))
            Kit.Setting(title: "Stocks", icon: .init(fill: .black, symbol: .stocks))
            Kit.Setting(title: "Weather", icon: .init(fill: .blue, symbol: .weather))
            Kit.Setting(title: "Translate", icon: .init(fill: .blue, symbol: .translate))
            Kit.Setting(title: "Maps", icon: .init(fill: .orange.opacity(0.7), symbol: .maps))
            Kit.Setting(title: "Compass", icon: .init(fill: .black, symbol: .compass))
            Kit.Setting(title: "Measure", icon: .init(fill: .black, symbol: .measure))
            Kit.Setting(title: "Shortcuts", icon: .init(fill: .purple, symbol: .shortcuts))
            Kit.Setting(title: "Health", icon: .init(fill: .red, symbol: .health))
        }
        
        Group(under: .media) {
            Kit.Setting(title: "Music", icon: .init(fill: .red.opacity(0.6), symbol: .music))
            Kit.Setting(title: "TV", icon: .init(fill: .black.opacity(0.7), symbol: .tv))
            Kit.Setting(title: "Photos", icon: .init(fill: .green.opacity(0.4), symbol: .photos))
            Kit.Setting(title: "Camera", icon: .init(fill: .gray, symbol: .camera))
            Kit.Setting(title: "Books", icon: .init(fill: .orange, symbol: .books))
            Kit.Setting(title: "Podcasts", icon: .init(fill: .purple, symbol: .podcasts))
            Kit.Setting(title: "Game Center", icon: .init(fill: .pink, symbol: .gameCenter))
        }
        
        Group(under: .tv) {
            Kit.Setting(title: "TV Provider", icon: .init(fill: .black.opacity(0.7), symbol: .tvProvider))
        }
        
        Group(under: .tv) {
            Kit.Setting(title: "Developer", icon: .init(fill: .blue.opacity(0.7), symbol: .developer))
        }
        
        Group(under: .apps) {
            Kit.Setting(title: "Drive", icon: .init(fill: .red.opacity(0.2), symbol: .gameCenter))
        }
    }
}
