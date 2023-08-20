public extension Kit.Setting {
    enum Symbol: CustomStringConvertible, Equatable {
        public enum Color {
            case white, black
        }

        case airplane
        case wifi
        case bluetooth
        case mobileData
        case personalHotspot
        case vpn
        case notifications
        case icloud
        case mediaAndPurchases
        case findMy
        case familySharing
        case soundsAndHaptic
        case focus
        case screenTime
        case general
        case controlCenter
        case displayAndBrightness
        case homeScreen
        case accessibility
        case wallpaper
        case siriAndSearch
        case faceIdAndPasscode
        case emergencySOS
        case exposureNotifications
        case battery
        case privacy
        case appStore
        case wallet
        case passwords
        case mail
        case contacts
        case calendar
        case notes
        case reminders
        case freeform
        case voiceMemos
        case phone
        case messages
        case facetime
        case safari
        case stocks
        case weather
        case translate
        case maps
        case compass
        case measure
        case shortcuts
        case health
        case music
        case tv
        case photos
        case camera
        case books
        case podcasts
        case gameCenter
        case tvProvider
        case developer
        case iphone
        case ipad
        case macbook
        case homepod
        case appleTV
        case watch
        case animation
        case interaction
        case apps
        case custom(String)
        case none

        public var description: String {
            switch self {
            case .airplane: return "airplane"
            case .wifi: return "wifi"
            case .bluetooth: return "dot.radiowaves.right"
            case .mobileData: return "antenna.radiowaves.left.and.right"
            case .personalHotspot: return "personalhotspot"
            case .vpn: return "network"
            case .notifications: return "bell.badge"
            case .soundsAndHaptic: return "slider.vertical.3"
            case .focus: return "moon"
            case .screenTime: return "hourglass"
            case .general: return "gear"
            case .controlCenter: return "switch.2"
            case .displayAndBrightness: return "textformat.size"
            case .homeScreen: return "house"
            case .accessibility: return "figure.stand"
            case .wallpaper: return "wallet.pass"
            case .siriAndSearch: return "allergens"
            case .faceIdAndPasscode: return "faceid"
            case .emergencySOS: return "cross.case"
            case .exposureNotifications: return "facemask"
            case .battery: return "battery.100"
            case .privacy: return "cross"
            case .passwords: return "hand.raised"
            case .mail: return "envelope"
            case .contacts: return "mail"
            case .calendar: return "calendar"
            case .notes: return "note.text"
            case .reminders: return "list.bullet.rectangle"
            case .freeform: return "pencil.tip.crop.circle.badge.plus"
            case .voiceMemos: return "record.circle"
            case .phone: return "phone"
            case .messages: return "message"
            case .facetime: return "video"
            case .safari: return "safari"
            case .stocks: return "chart.xyaxis.line"
            case .weather: return "sun.min"
            case .translate: return "character.cursor.ibeam"
            case .maps: return "map"
            case .compass: return "barometer"
            case .measure: return "lines.measurement.horizontal"
            case .shortcuts: return "flipphone"
            case .health: return "heart"
            case .music: return "music.note"
            case .tv: return "play.tv"
            case .photos: return "text.below.photo"
            case .camera: return "camera"
            case .books: return "book"
            case .podcasts: return "ipodshuffle.gen4"
            case .gameCenter: return "gamecontroller"
            case .tvProvider: return "4k.tv"
            case .developer: return "wrench"
            case .appStore: return "applelogo"
            case .wallet: return "wallet.pass"
            case .none: return ""
            case .custom(let string): return string
            case .icloud: return "icloud"
            case .mediaAndPurchases: return "tv.and.mediabox"
            case .findMy: return "location.viewfinder"
            case .familySharing: return "person.2"
            case .iphone: return "iphone.smartbatterycase.gen2"
            case .ipad: return "ipad"
            case .macbook: return "laptopcomputer"
            case .homepod: return "homepodmini"
            case .appleTV: return "appletv"
            case .watch: return "applewatch"
            case .interaction: return "hand.tap"
            case .apps: return "app.badge"
            case .animation: return "hourglass"
                
            }
        }
    }
}
