import Foundation

struct App: Decodable, Identifiable, Hashable {
    let id: UUID
    let description, releaseType, iconSource: String?
    let displayName, name: String
    // swiftlint:disable:next identifier_name
    let os: OperationSystem
    let iconUrl: URL?
    let owner: Owner
    let appSecret: String
    let azureSubscription: AzureSubscription?
    let platform: Platform
    let origin: Origin
    let createdAt, updatedAt: Date?
    let memberPermissions: Set<Permission>?

    static func == (lhs: App, rhs: App) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        id.hash(into: &hasher)
    }
}

struct AzureSubscription: Decodable {
    let subscriptionId, tenantId: UUID
    let subscriptionName: String
    let isBilling, isBillable, isMicrosoftInternal: Bool?
}

struct Owner: Decodable {
    let id: UUID
    let avatarUrl: URL?
    let name, displayName: String
    let email: String?
    let type: OwnerType
}
