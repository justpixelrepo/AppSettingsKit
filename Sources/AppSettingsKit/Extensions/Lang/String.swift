import UIKit
public extension String {
    
    @resultBuilder
    struct EmptySpaceBuilder {
        static func buildBlock(_ parts: String...) -> String {
            parts.joined(separator: " ")
        }
    }
    
    static let any: Self = "Any Text"
    static let empty: Self = " " 
}
