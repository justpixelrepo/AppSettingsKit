public extension Kit.Setting.Profile {
    struct Family {
        var subscriptions: Subscriptions = .init()
        var purchases: Purchases = .init()
        var locationSharing: LocationSharing = .init()
    }
}

public extension Kit.Setting.Profile.Family {
    struct Subscriptions {}
    struct Purchases {}
    struct LocationSharing {}
}
