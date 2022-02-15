public extension Kit.Setting {
    struct Name {
        var first: String
        var middle: String
        var last: String

        @String.EmptySpaceBuilder
        var fullName: String {
            first
            middle
            last
        }

        public init(
            first: String = "Codebendr",
            middle: String = "Domina",
            last: String = "Attafuah"
        ) {
            self.first = first
            self.middle = middle
            self.last = last
        }
    }

    struct Profile {
        var name: Name
        var email: String
        var altEmail: String
        var number: String = "+233 246591214"
        var DOB = "01/05/1982"

        public init(
            name: Kit.Setting.Name,
            email: String = "codebendr@ninjadev.com",
            altEmail: String = "transformers@icloud.com"
        ) {
            self.name = name
            self.email = email
            self.altEmail = altEmail
        }
    }

    struct Subscriptions {
        var announcement = false
        var specialOffersNotifications = false
    }
}
