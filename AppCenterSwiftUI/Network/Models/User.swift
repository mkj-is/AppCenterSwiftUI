import Foundation

struct User: Decodable {
    let id: UUID
    let avatarUrl: URL?
    let canChangePassword: Bool
    let displayName, email, name: String
    let origin: String
}
