public extension Kit.Setting {
    struct Name {
        var first: String
        var middle: String
        var last: String

        public init(
            first: String = "Codebendr",
            middle: String = "Swift",
            last: String = "SwiftUI")
        {
            self.first = first
            self.middle = middle
            self.last = last
        }
    }

    struct Profile {
        var name: Name
        var email: String

        public init(
            name: Kit.Setting.Name,
            email: String = "codebendr@icloud.com")
        {
            self.name = name
            self.email = email
        }
    }
}
