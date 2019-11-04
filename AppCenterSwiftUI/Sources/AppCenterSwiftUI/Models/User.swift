import Foundation

struct User: Decodable, Hashable {
    let id: UUID
    let avatarUrl: URL?
    let canChangePassword: Bool
    let displayName, email, name: String
    let origin: String
    let permissions: Set<Permission>?

    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        id.hash(into: &hasher)
    }
}
