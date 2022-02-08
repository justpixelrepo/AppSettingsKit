public extension Kit.Setting {
    @GroupBuilder
    static var profile: [Group] {
        Group(under: .account) {
            Kit.Setting(title: "Name, Phone Numbers, Email")
            Kit.Setting(title: "Password & Security")
            Kit.Setting(title: "Payment & Shipping", subtitle: "Visa")
            Kit.Setting(title: "Subscriptions")
        }

        Group(under: .icloud) {
            Kit.Setting(title: "iCloud", subtitle: "200GB", icon: .init(fill: .white, color: .blue, symbol: .icloud))

            Kit.Setting(title: "Media & Purchases", icon: .init(fill: .blue, symbol: .mediaAndPurchases))
            
            Kit.Setting(title: "Find My", icon: .init(fill: .green, symbol: .findMy))
            
            Kit.Setting(title: "Family Sharing", subtitle: "Kuks, Dr Naana, Tara, Ama", icon: .init(fill: .white, color: .blue, symbol: .familySharing))
        }
        
        Group(under: .devices) {
            Kit.Setting(type: .subtitle, title: "iPhone 12", subtitle: "This iPhone 12", icon: .init(symbol: .iphone))

            Kit.Setting(type: .subtitle, title: "Big Sur", subtitle: "Macbook Pro 13", icon: .init(symbol: .macbook))
            
            Kit.Setting(type: .subtitle, title: "Cinema", subtitle: "Apple TV 4K", icon: .init(symbol: .appleTV))
            
            Kit.Setting(type: .subtitle, title: "codebender", subtitle: "Macbook Pro 14", icon: .init(symbol: .macbook))
            
            Kit.Setting(type: .subtitle, title: "Front Speaker", subtitle: "HomePod mini", icon: .init(symbol: .homepod))
            
            Kit.Setting(type: .subtitle, title: "Back Speaker", subtitle: "HomePod mini", icon: .init(symbol: .homepod))
            
            Kit.Setting(type: .subtitle, title: "iPad Pro", subtitle: "iPad Pro", icon: .init(symbol: .ipad))
            
            Kit.Setting(type: .subtitle, title: "iPhone", subtitle: "iPhone 7", icon: .init(symbol: .iphone))
            
            Kit.Setting(type: .subtitle, title: "Left Speaker", subtitle: "HomePod mini", icon: .init(symbol: .homepod))
            
            Kit.Setting(type: .subtitle, title: "Ngaa's iPad", subtitle: "iPad Pro", icon: .init(symbol: .ipad))
            
            Kit.Setting(type: .subtitle, title: "Right Speaker", subtitle: "HomePod mini", icon: .init(symbol: .homepod))

            Kit.Setting(type: .subtitle, title: "Swift", subtitle: "Apple TV HD", icon: .init(symbol: .appleTV))
            
            Kit.Setting(type: .subtitle, title: "Watch", subtitle: "Apple Watch Series 6", icon: .init(symbol: .watch))
        }
    }
}
