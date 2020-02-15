import Foundation

struct Destination: Decodable {
    let id: String
    let isLatest: Bool?
    let type: DistributionStore?
    let publishingStatus: String?
    let destinationType: DestinationType?
    let name, displayName: String?
}

struct Build: Decodable {
    let branchName, commitHash, commitMessage: String
}

struct DistributionGroup: Decodable {
    let id, name: String
}

struct Release: Decodable, Identifiable, Hashable {
    let origin: Origin?
    let id: UInt
    let shortVersion, version: String
    let uploadedAt: Date?
    let enabled: Bool
    let destinations: [Destination]?
    let build: Build?

    static func == (lhs: Release, rhs: Release) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct AppRelease: Hashable {
    let app: App
    let release: Release

    func hash(into hasher: inout Hasher) {
        hasher.combine(app)
        hasher.combine(release)
    }
}

struct ReleaseDetail: Decodable, Identifiable, Equatable {
    let id: UInt
    let appName, appDisplayName, version, shortVersion: String
    let appOs, releaseNotes: String?
    let origin: Origin?
    let provisioningProfileName: String?
    let provisioningProfileType: ProvisioningProfileType?
    let provisioningProfileExpiryDate: Date?
    let isProvisioningProfileSyncing: Bool?
    let size: Int?
    let minOS, deviceFamily, androidMinApiLevel, bundleIdentifier: String?
    let packageHashes: [String]?
    let fingerprint: String?
    let uploadedAt: Date?
    let downloadUrl, appIconUrl, installUrl: URL?
    let destinations: [Destination]?
    let isUdidProvisioned, canResign: Bool?
    let build: Build?
    let enabled: Bool
    let status: String?
    let isExternalBuild: Bool

    var release: Release {
        Release(origin: origin, id: id, shortVersion: shortVersion, version: version, uploadedAt: uploadedAt, enabled: enabled, destinations: destinations, build: build)
    }

    static func == (lhs: ReleaseDetail, rhs: ReleaseDetail) -> Bool {
        lhs.id == rhs.id
    }
}
