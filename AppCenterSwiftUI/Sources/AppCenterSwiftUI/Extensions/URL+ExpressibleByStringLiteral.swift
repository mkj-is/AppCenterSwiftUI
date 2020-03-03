import Foundation

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: StaticString) {
        if let url = URL(string: "\(value)") {
            self = url
        } else {
            fatalError("URL could not be created from literal: \(value)")
        }
    }
}
