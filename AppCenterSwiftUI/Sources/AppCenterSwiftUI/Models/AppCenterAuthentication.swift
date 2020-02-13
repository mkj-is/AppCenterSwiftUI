import Foundation

struct BasicAuthentication: Equatable {
    let user, password: String
}

enum AppCenterAuthentication {
    case token(String)
    case basic(BasicAuthentication)
}

enum Scope: String, Codable {
    case all
    case viewer
}
