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
            Kit.Setting(type: .subtitle, title: "iCloud", subtitle: "200GB", icon: .init(fill: .white, color: .blue, symbol: .iphone))

            Kit.Setting(title: "Media & Purchases", icon: .init(fill: .blue, symbol: .mediaAndPurchases))
            
            Kit.Setting(title: "Find My", icon: .init(fill: .green, symbol: .findMy))
            
            Kit.Setting(title: "Family Sharing", subtitle: "Kuks, Dr Naana, Tara, Ama", icon: .init(fill: .white, color: .blue, symbol: .familySharing))
            
        }
    }
}
