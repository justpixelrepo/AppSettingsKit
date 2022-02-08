import Combine
public extension Kit.Setting {

    @resultBuilder
    enum ArrayBuilder {
        static func buildEither(first component: [Kit.Setting]) -> [Kit.Setting] { component }

        static func buildEither(second component: [Kit.Setting]) -> [Kit.Setting] { component }

        static func buildOptional(_ component: [Kit.Setting]?) -> [Kit.Setting] { component ?? [] }

        static func buildExpression(_ expression: Kit.Setting) -> [Kit.Setting] { [expression] }

        static func buildExpression(_ expression: ()) -> [Kit.Setting] { [] }

        static func buildBlock(_ component: [Kit.Setting]...) -> [Kit.Setting] { component.flatMap { $0 } }
    }

    @resultBuilder
    enum GroupBuilder {
 
        typealias Group = Kit.Setting.Group

        static func buildEither(first component: [Group]) -> [Group] { component }

        static func buildEither(second component: [Group]) -> [Group] { component }

        static func buildOptional(_ component: [Group]?) -> [Group] { component ?? [] }

        static func buildExpression(_ expression: Group) -> [Group] { [expression] }

        static func buildExpression(_ expression: ()) -> [Group] { [] }

        static func buildBlock(_ component: [Group]...) -> [Group] { component.flatMap { $0 } }
        
        static func buildArray(_ components: [[Group]]) -> [Group] { components.flatMap { $0 }  }
    
    }
}
